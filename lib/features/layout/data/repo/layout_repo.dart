import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../splash/data/models/data_model.dart';
import '../../../splash/data/models/machine_model.dart';

abstract class LayoutRepo {
  Future<Either<Failure, DataModel>> changeTheme({required String theme});

  Future<Either<Failure, DataModel>> changeLang({required String lang});

  Future<Either<Failure, DataModel>> newMachine({required String title});

  Future<Either<Failure, DataModel>> removeMachine({required Machine machine});

  Future<Either<Failure, DataModel>> newCustomer({
    required int machineId,
    required String title,
    required int quantity,
    required int state,
  });

  Future<Either<Failure, DataModel>> removeCustomer({
    required int machineId,
    required int customerId,
  });

  Future<Either<Failure, DataModel>> editCustomer({
    required int machineId,
    required int customerId,
    required String title,
    required int quantity,
    required int state,
  });
}
