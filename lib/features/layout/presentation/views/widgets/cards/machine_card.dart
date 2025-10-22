// ignore_for_file: deprecated_member_use
import '../delete_icon.dart';
import '../lists/customers.dart';
import '../add/add_customer.dart';
import 'package:flutter/material.dart';
import '../../../manager/app_cubit.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../splash/data/models/machine_model.dart';
import '../../../../../../core/utils/dialog_services.dart';

class MachineCard extends StatelessWidget {
  final Machine machine;
  const MachineCard({super.key, required this.machine});

  @override
  Widget build(BuildContext context) {
    final cubit = AppCubit.get(context);
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      margin: EdgeInsets.symmetric(horizontal: 10.r),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        children: [
          _MachineCardTop(
            machine: machine,
            deleteMachineTap: () => cubit.removeMachine(machine: machine),
          ),
          _MachineCardCenter(machineId: machine.id),
          _MachineCardBody(machine: machine),
        ],
      ),
    );
  }
}

class _MachineCardTop extends StatelessWidget {
  final Machine machine;
  final void Function() deleteMachineTap;
  const _MachineCardTop({
    required this.machine,
    required this.deleteMachineTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.current;
    return Container(
      color: Colors.deepOrange,
      padding: EdgeInsets.all(10.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                isHead: true,
                fontSize: 18,
                title: machine.title,
                fontColor: Colors.white,
              ),
              CustomText(
                isHead: true,
                fontSize: 17,
                fontColor: Colors.white,
                title: "${s.customers_number}: ${machine.customers.length}",
              ),
            ],
          ),
          DeleteIcon(deleteTap: deleteMachineTap, color: Colors.white),
        ],
      ),
    );
  }
}

class _MachineCardCenter extends StatelessWidget {
  final int machineId;
  const _MachineCardCenter({required this.machineId});

  @override
  Widget build(BuildContext context) {
    final cubit = AppCubit.get(context);
    final s = S.current;
    return Padding(
      padding: EdgeInsets.all(10.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(isHead: true, title: s.customers, fontSize: 20),
          GestureDetector(
            onTap: () {
              DialogServices.add(
                context: context,
                body: AddCustomer(),
                onTap: () => cubit.addCustomer(machineId: machineId),
              );
            },
            child: CircleAvatar(
              backgroundColor: Styles.green,
              child: Icon(
                Icons.add,
                size: 20.r,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MachineCardBody extends StatelessWidget {
  final Machine machine;
  const _MachineCardBody({required this.machine});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          machine.customers.isEmpty || machine.customers.length == 1
              ? 90.h
              : 180.h,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          end: machine.customers.length > 2 ? 6.w : 0,
        ),
        child: Customers(machineId: machine.id, isCard: true),
      ),
    );
  }
}
