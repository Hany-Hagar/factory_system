import 'lists/customers.dart';
import 'lists/customers_search.dart';
import '../../manager/app_cubit.dart';
import 'package:flutter/material.dart';
import '../../manager/app_states.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MachineViewBody extends StatelessWidget {
  final int machineId;
  const MachineViewBody({super.key, required this.machineId});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return SingleChildScrollView(
      child: BlocBuilder<AppCubit, AppStates>(
        builder:
            (context, state) =>
                cubit.searchOpen ? _Search() : _Body(machineId: machineId),
      ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(10.r),
          child: CustomText(isHead: true, title: s.customers),
        ),
        CustomersSearch(),
        SizedBox(height: 70.h),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final int machineId;

  const _Body({required this.machineId});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(10.r),
          child: CustomText(isHead: true, title: s.customers),
        ),
        Customers(isCard: false, machineId: machineId),
        SizedBox(height: 70.h),
      ],
    );
  }
}
