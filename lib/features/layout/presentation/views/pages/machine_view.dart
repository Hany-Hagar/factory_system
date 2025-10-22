// ignore_for_file: deprecated_member_use

import '../../manager/app_cubit.dart';
import 'package:flutter/material.dart';
import '../widgets/add/add_customer.dart';
import '../widgets/machine_view_body.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/widgets/back_ground.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/utils/dialog_services.dart';
import '../../../../../core/utils/navigator_methods.dart';
import '../../../../splash/data/models/machine_model.dart';

class MachineView extends StatelessWidget {
  final Machine machine;
  const MachineView({super.key, required this.machine});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = AppCubit.get(context);

    return BackGround(
      top: _Top(machine: machine),
      body: MachineViewBody(machineId: machine.id),
      controller: cubit.searchValue,
      hintText: s.customer_search_hint,
      onChanged: (p0) => cubit.CustomersSearch(MachineId: machine.id),
      floatingOnPressed: () {
        DialogServices.add(
          context: context,
          body: AddCustomer(),
          onTap: () => cubit.addCustomer(machineId: machine.id),
        );
      },
    );
  }
}

class _Top extends StatelessWidget {
  final Machine machine;
  const _Top({required this.machine});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).hintColor;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            NavTo.pop(context: context);
            AppCubit.get(context).resetSearch();
          },
          child: CircleAvatar(
            backgroundColor: theme.withOpacity(0.25),
            child: Icon(Icons.arrow_back_ios_new, size: 24, color: theme),
          ),
        ),
        Expanded(flex: 2, child: SizedBox()),
        CustomText(isHead: true, title: machine.title),
        Expanded(flex: 3, child: SizedBox()),
      ],
    );
  }
}
