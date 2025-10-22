import '../empty.dart';
import 'customers_search.dart';
import '../cards/machine_card.dart';
import '../../pages/machine_view.dart';
import 'package:flutter/material.dart';
import '../../../manager/app_cubit.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/navigator_methods.dart';

class GeneralSearch extends StatelessWidget {
  const GeneralSearch({super.key});

  @override
  Widget build(BuildContext context) {
    // var cubit = AppCubit.get(context);
    return _Body();
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Column(
      children: [
        if (cubit.searchMachines.isEmpty && cubit.searchCustomers.isEmpty)
          Empty(state: EState.search),
        if (cubit.searchMachines.isNotEmpty) _Machines(),
        if (cubit.searchCustomers.isNotEmpty) _Customers(),
      ],
    );
  }
}

class _Machines extends StatelessWidget {
  const _Machines();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final cubit = AppCubit.get(context);
    final machines = cubit.searchMachines;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(10.r),
          child: CustomText(isHead: true, title: s.machines),
        ),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: machines.length,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
          itemBuilder: (context, index) {
            var machine = cubit.userData.machines[machines[index]];
            return GestureDetector(
              onTap: () {
                NavTo.push(
                  context: context,
                  nextPage: MachineView(machine: machine),
                );
              },
              child: MachineCard(machine: machine),
            );
          },
        ),
      ],
    );
  }
}

class _Customers extends StatelessWidget {
  const _Customers();

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
      ],
    );
  }
}
