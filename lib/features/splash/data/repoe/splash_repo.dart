import 'package:dartz/dartz.dart';
import '../models/data_model.dart';
import '../../../../core/errors/hive_failure.dart';

abstract class SplashRepo {
  Future<Either<HiveFailure, DataModel>> fetchData();
}
