import '../empty.dart';
import '../cards/machine_card.dart';
import '../../pages/machine_view.dart';
import 'package:flutter/material.dart';
import '../../../manager/app_cubit.dart';
import '../../../manager/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/navigator_methods.dart';
import '../../../../../splash/data/models/machine_model.dart';

class Machines extends StatelessWidget {
  const Machines({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    var machines = cubit.userData.machines;
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return machines.isEmpty
            ? Empty(state: EState.list)
            : _Machines(machines: machines);
      },
    );
  }
}

class _Machines extends StatelessWidget {
  final List<Machine> machines;
  const _Machines({required this.machines});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: machines.length,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemBuilder:
          (context, index) => GestureDetector(
            onTap: () {
              NavTo.push(
                context: context,
                nextPage: MachineView(machine: machines[index]),
              );
            },
            child: MachineCard(machine: machines[index]),
          ),
    );
  }
}
