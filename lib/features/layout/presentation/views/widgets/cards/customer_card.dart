// ignore_for_file: deprecated_member_use
import '../delete_icon.dart';
import '../add/add_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../manager/app_cubit.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/utils/dialog_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../splash/data/models/customer_model.dart';

class CustomerCard extends StatelessWidget {
  final Customer customer;
  final bool isMachineCard;
  const CustomerCard({
    super.key,
    required this.customer,
    required this.isMachineCard,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = AppCubit.get(context);
    final theme = Theme.of(context);
    var fontColor =
        cubit.theme == ThemeMode.dark
            ? theme.hintColor
            : isMachineCard
            ? theme.scaffoldBackgroundColor
            : theme.hintColor;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.r),
      padding: EdgeInsetsDirectional.only(start: 10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color:
            isMachineCard
                ? Colors.black12
                : Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        children: [
          _CustomerCardTop(
            color: fontColor,
            customer: customer,
            editTap: () {
              cubit.setEditData(customer: customer);
              DialogServices.add(
                body: AddCustomer(),
                onTap:
                    () => cubit.editCustomers(
                      machineId: customer.machineId,
                      customerId: customer.id,
                    ),
                context: context,
              );
            },

            deleteTap:
                () => cubit.deletCustomers(
                  CustomerId: customer.id,
                  machineId: customer.machineId,
                ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: 8.h, end: 8.r),
            child: _CustomerCardBottom(customer: customer, color: fontColor),
          ),
        ],
      ),
    );
  }
}

class _CustomerCardTop extends StatelessWidget {
  final Color color;
  final Customer customer;
  final Function() editTap;
  final Function() deleteTap;

  const _CustomerCardTop({
    required this.customer,
    required this.editTap,
    required this.deleteTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          isHead: true,
          title: "🧑 ${customer.title}",
          fontSize: 20,
          fontColor: color,
        ),
        Row(
          children: [
            IconButton(
              onPressed: editTap,
              icon: Icon(size: 24, CupertinoIcons.create, color: color),
            ),
            DeleteIcon(size: 20, deleteTap: deleteTap, color: color),
          ],
        ),
      ],
    );
  }
}

class _CustomerCardBottom extends StatelessWidget {
  final Color color;
  final Customer customer;
  const _CustomerCardBottom({required this.customer, required this.color});

  @override
  Widget build(BuildContext context) {
    final cubit = AppCubit.get(context);
    final s = S.current;
    var stateColor = Color(cubit.machineStates(s: s)[customer.state].color);
    var stateTitle = cubit.machineStates(s: s)[customer.state].title;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomText(
              isHead: true,
              fontSize: 18,
              title: "${s.customer_quantity} :",
              fontColor: color,
            ),
            CustomText(
              isHead: true,
              fontSize: 15,
              title: " ${customer.quantity}",
              fontColor: color,
            ),
          ],
        ),
        Container(
          width: 80.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: stateColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: CustomText(
              isHead: true,
              fontSize: 17,
              title: stateTitle,
              fontColor: color,
            ),
          ),
        ),
      ],
    );
  }
}
