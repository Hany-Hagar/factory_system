import 'package:hive/hive.dart';
import 'package:dartz/dartz.dart';
import '../errors/hive_failure.dart';
import '../../features/splash/data/models/data_model.dart';
import '../../features/splash/data/models/machine_model.dart';
import '../../features/splash/data/models/customer_model.dart';

class HiveService {
  static const String _dataBoxName = 'dataBox';
  static const String _dataKey = 'main_data';

  static Future<Either<HiveFailure, bool>> openBox() async {
    try {
      if (!Hive.isBoxOpen(_dataBoxName)) {
        await Hive.openBox<DataModel>(_dataBoxName);
      }
      return right(true);
    } catch (e) {
      return left(HiveFailure.fromException(e));
    }
  }

  static Future<Either<HiveFailure, DataModel>> get() async {
    try {
      final box = Hive.box<DataModel>(_dataBoxName);
      DataModel? model = box.get(_dataKey);
      return right(model ?? DataModel.empty());
    } catch (e) {
      return left(HiveFailure.fromException(e));
    }
  }

  static Future<Either<HiveFailure, DataModel>> save({
    required DataModel data,
  }) async {
    try {
      final box = Hive.box<DataModel>(_dataBoxName);
      await box.put(_dataKey, data);
      return right(data);
    } catch (e) {
      return left(HiveFailure.fromException(e));
    }
  }

  static Future<Either<HiveFailure, DataModel>> changeTheme({
    required String theme,
  }) async {
    try {
      final result = await get();
      return await result.fold((failure) => left(failure), (data) async {
        final newData = data.copy(themeMode: theme);
        await save(data: newData);
        return right(newData);
      });
    } catch (e) {
      return left(HiveFailure.fromException(e));
    }
  }

  static Future<Either<HiveFailure, DataModel>> changeLang({
    required String lang,
  }) async {
    try {
      final result = await get();
      return await result.fold((failure) => left(failure), (data) async {
        final newData = data.copy(lang: lang);
        await save(data: newData);
        return right(newData);
      });
    } catch (e) {
      return left(HiveFailure.fromException(e));
    }
  }

  // ✅ إضافة ماكينة
  static Future<Either<HiveFailure, DataModel>> addMachine({
    required String title,
  }) async {
    try {
      final result = await get();
      return await result.fold((failure) => left(failure), (data) async {
        final newData = data.newMachine(title: title);
        await save(data: newData);
        return right(newData);
      });
    } catch (e) {
      return left(HiveFailure.fromException(e));
    }
  }

  // ✅ حذف ماكينة
  static Future<Either<HiveFailure, DataModel>> removeMachine({
    required Machine machine,
  }) async {
    try {
      final result = await get();
      return await result.fold((failure) => left(failure), (data) async {
        final newData = data.deleteMachine(machine: machine);
        await save(data: newData);
        return right(newData);
      });
    } catch (e) {
      return left(HiveFailure.fromException(e));
    }
  }

  // ✅ إضافة زبون
  static Future<Either<HiveFailure, DataModel>> addCustomer({
    required int machineId,
    required String title,
    required int quantity,
    required int state,
  }) async {
    try {
      final result = await get();
      return await result.fold((failure) => left(failure), (data) async {
        final machines = List<Machine>.from(data.machines);
        final index = machines.indexWhere((m) => m.id == machineId);

        if (index == -1) {
          return left(HiveFailure("Machine with ID $machineId not found"));
        }

        final updatedMachine = machines[index].AddCustomer(
          title: title,
          quantity: quantity,
          state: state,
        );

        machines[index] = updatedMachine;
        final newData = data.copy(machines: machines);

        await save(data: newData);
        return right(newData);
      });
    } catch (e) {
      return left(HiveFailure.fromException(e));
    }
  }

  // ✅ حذف زبون
  static Future<Either<HiveFailure, DataModel>> removeCustomer({
    required int machineId,
    required int customerId,
  }) async {
    try {
      final result = await get();
      return await result.fold((failure) => left(failure), (data) async {
        final machines = List<Machine>.from(data.machines);
        final index = machines.indexWhere((m) => m.id == machineId);

        if (index == -1) {
          return left(HiveFailure("Machine with ID $machineId not found"));
        }

        final updatedMachine = machines[index];
        updatedMachine.customers.removeWhere(
          (customer) => customer.id == customerId,
        );

        machines[index] = updatedMachine;
        final newData = data.copy(machines: machines);

        await save(data: newData);
        return right(newData);
      });
    } catch (e) {
      return left(HiveFailure.fromException(e));
    }
  }

  // ✅ تعديل زبون داخل ماكينة
  static Future<Either<HiveFailure, DataModel>> editCustomer({
    required int machineId,
    required int customerId,
    required String? title,
    required int? quantity,
    required int? state,
  }) async {
    try {
      final result = await get();

      return await result.fold((failure) => left(failure), (data) async {
        final machines = List<Machine>.from(data.machines);
        final machineIndex = machines.indexWhere((m) => m.id == machineId);

        if (machineIndex == -1) {
          return left(HiveFailure("Machine with ID $machineId not found"));
        }

        final machine = machines[machineIndex];
        final customers = List<Customer>.from(machine.customers);
        final customerIndex = customers.indexWhere((c) => c.id == customerId);

        if (customerIndex == -1) {
          return left(HiveFailure("Customer with ID $customerId not found"));
        }

        final oldCustomer = customers[customerIndex];
        final updatedCustomer = oldCustomer.copyWith(
          title: title,
          quantity: quantity,
          state: state,
        );

        customers[customerIndex] = updatedCustomer;
        final updatedMachine = machine.copyWith(customers: customers);
        machines[machineIndex] = updatedMachine;

        final newData = data.copy(machines: machines);
        await save(data: newData);
        return right(newData);
      });
    } catch (e) {
      return left(HiveFailure.fromException(e));
    }
  }
}
