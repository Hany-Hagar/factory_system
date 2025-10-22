import 'layout_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/hive_services.dart';
import '../../../splash/data/models/data_model.dart';
import '../../../splash/data/models/machine_model.dart';

class LayoutRepoImpl implements LayoutRepo {
  @override
  Future<Either<Failure, DataModel>> changeTheme({required String theme}) {
    var hiveData = HiveService.changeTheme(theme: theme);
    return hiveData;
  }

  @override
  Future<Either<Failure, DataModel>> changeLang({required String lang}) {
    var hiveData = HiveService.changeLang(lang: lang);
    return hiveData;
  }

  @override
  Future<Either<Failure, DataModel>> newMachine({required String title}) {
    var hiveData = HiveService.addMachine(title: title);
    return hiveData;
  }

  @override
  Future<Either<Failure, DataModel>> removeMachine({required Machine machine}) {
    var hiveData = HiveService.removeMachine(machine: machine);
    return hiveData;
  }

  @override
  Future<Either<Failure, DataModel>> newCustomer({
    required int machineId,
    required String title,
    required int quantity,
    required int state,
  }) {
    var hiveData = HiveService.addCustomer(
      machineId: machineId,
      title: title,
      quantity: quantity,
      state: state,
    );
    return hiveData;
  }

  @override
  Future<Either<Failure, DataModel>> removeCustomer({
    required int machineId,
    required int customerId,
  }) {
    var hiveData = HiveService.removeCustomer(
      customerId: customerId,
      machineId: machineId,
    );
    return hiveData;
  }

  @override
  Future<Either<Failure, DataModel>> editCustomer({
    required int machineId,
    required int customerId,
    required String title,
    required int quantity,
    required int state,
  }) {
    var hiveData = HiveService.editCustomer(
      machineId: machineId,
      customerId: customerId,
      quantity: quantity,
      state: state,
      title: title,
    );
    return hiveData;
  }
}
