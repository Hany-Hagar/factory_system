
import 'failure.dart';
import 'package:hive/hive.dart';


class HiveFailure extends Failure {
  HiveFailure(super.errMessage);

  factory HiveFailure.fromHiveError(HiveError hiveError) {
    if (hiveError.message.contains('Box not found')) {
      return HiveFailure('The requested Hive box was not found.');
    } else if (hiveError.message.contains('Box is already open')) {
      return HiveFailure('The Hive box is already open.');
    } else if (hiveError.message.contains('Corrupted box file')) {
      return HiveFailure('The Hive box file is corrupted. Please clear the data and try again.');
    } else if (hiveError.message.contains('Read-only file system')) {
      return HiveFailure('The Hive box is on a read-only file system and cannot be written to.');
    } else {
      return HiveFailure('Unexpected Hive error: ${hiveError.message}');
    }
  }

  factory HiveFailure.fromException(dynamic exception) {
    if (exception is HiveError) {
      return HiveFailure.fromHiveError(exception);
    } else {
      return HiveFailure('An unknown error occurred while using Hive: ${exception.toString()}');
    }
  }
}