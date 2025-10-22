import 'splash_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/data_model.dart';
import '../../../../core/utils/hive_services.dart';
import '../../../../core/errors/hive_failure.dart';


class SplashRepoImpl extends SplashRepo {

@override
  Future<Either<HiveFailure, DataModel>> fetchData(){
    final response = HiveService.get();
    return response;
  }


}
