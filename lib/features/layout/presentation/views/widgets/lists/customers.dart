import '../empty.dart';
import '../cards/customer_card.dart';
import 'package:flutter/material.dart';
import '../../../manager/app_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../splash/data/models/customer_model.dart';

class Customers extends StatelessWidget {
  final bool isCard;
  final int machineId;
  const Customers({super.key, required this.machineId, required this.isCard});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    var customers =
        cubit
            .userData
            .machines[cubit.getMachineIndexById(id: machineId)]
            .customers;
    return customers.isEmpty
        ? isCard
            ? Empty(state: EState.card)
            : Empty(state: EState.list)
        : isCard
        ? _ScrollbarCustomers(customers: customers)
        : _Customers(customers: customers, isCard: isCard);
  }
}

class _ScrollbarCustomers extends StatelessWidget {
  final List<Customer> customers;
  const _ScrollbarCustomers({required this.customers});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 10.r),
      child: Scrollbar(
        controller: controller,
        thumbVisibility: _showScrollBar(length: customers.length),
        trackVisibility: _showScrollBar(length: customers.length),
        child: _Customers(customers: customers, isCard: true),
      ),
    );
  }
}

class _Customers extends StatelessWidget {
  final bool isCard;
  final List<Customer> customers;
  const _Customers({required this.customers, required this.isCard});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: customers.length,
      physics: _setPhysis(isCard: isCard, length: customers.length),
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemBuilder:
          (context, index) =>
              CustomerCard(customer: customers[index], isMachineCard: isCard),
    );
  }
}

ScrollPhysics _setPhysis({required bool isCard, required int length}) {
  return isCard
      ? length > 2
          ? BouncingScrollPhysics()
          : NeverScrollableScrollPhysics()
      : NeverScrollableScrollPhysics();
}

bool _showScrollBar({required int length}) {
  return length > 2;
}
