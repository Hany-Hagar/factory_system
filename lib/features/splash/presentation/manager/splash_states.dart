import '../../data/models/data_model.dart';

abstract class SplashStates {}

class InitialState extends SplashStates {}

class LoadingState extends SplashStates {}

class SuccessState extends SplashStates {
  final DataModel data;
  SuccessState({required this.data});
}

class FailureState extends SplashStates {
  final String errorMessage;
  FailureState({required this.errorMessage});
}
