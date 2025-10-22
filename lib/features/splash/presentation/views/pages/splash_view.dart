import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../manager/splash_cubit.dart';
import '../../manager/splash_states.dart';
import '../widgets/splash_view_body.dart';
import '../../../data/models/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/navigator_methods.dart';
import '../../../../layout/presentation/manager/app_cubit.dart';
import '../../../../layout/presentation/views/pages/layout_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..fetchMachines(),
      child: BlocConsumer<SplashCubit, SplashStates>(
        listener: (context, state) {
          final cubit = AppCubit.get(context);
          if (state is SuccessState) {
            cubit.setUserData(model: state.data);
            NavTo.pushReplacement(context: context, nextPage: LayoutView());
          }
          if (state is FailureState) {
            cubit.setUserData(model: DataModel.empty());
            NavTo.pushReplacement(context: context, nextPage: LayoutView());
          }
        },
        builder: (context, state) {
          return SplashViewBody(image: "assets/images/appLogo.png");
        },
      ),
    );
  }
}
