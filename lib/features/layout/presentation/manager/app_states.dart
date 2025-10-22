abstract class AppStates{}

class InitialState extends AppStates{}

class SetState extends AppStates{}

class LoadingState extends AppStates{}
class SuccessState extends AppStates{}
class FailureState extends AppStates{
  final String errorMessage;
  FailureState({required this.errorMessage});
}

