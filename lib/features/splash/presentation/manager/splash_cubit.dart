import 'splash_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repoe/splash_repo_impl.dart';


class SplashCubit extends Cubit<SplashStates> {
  SplashCubit() : super(InitialState());
  static SplashCubit get(context) => BlocProvider.of<SplashCubit>(context);

  Future<void> fetchMachines() async {
    emit(LoadingState());
    var data = await SplashRepoImpl().fetchData();
    data.fold(
            (l) => emit(FailureState(errorMessage: l.errMessage)),
            (r) => emit(SuccessState(data: r)),
    );
  }


}