import '../empty.dart';
import '../cards/customer_card.dart';
import 'package:flutter/material.dart';
import '../../pages/machine_view.dart';
import '../../../manager/app_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/navigator_methods.dart';

class CustomersSearch extends StatelessWidget {
  const CustomersSearch({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    var customers = cubit.searchCustomers;
    return customers.isEmpty
        ? Empty(state: EState.search)
        : _Customers(customers: customers);
  }
}

class _Customers extends StatelessWidget {
  final List<Map<int, int>> customers;
  const _Customers({required this.customers});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: customers.length,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemBuilder: (context, index) {
        var cu = customers[index];
        var machineKey = cu.keys.first;
        var customerKey = cu.values.first;
        return GestureDetector(
          onTap: () {
            var machine = cubit.userData.machines[machineKey];
            NavTo.push(
              context: context,
              nextPage: MachineView(machine: machine),
            );
            cubit.resetSearch();
          },
          child: CustomerCard(
            customer:
                cubit.userData.machines[machineKey].customers[customerKey],
            isMachineCard: false,
          ),
        );
      },
    );
  }
}
