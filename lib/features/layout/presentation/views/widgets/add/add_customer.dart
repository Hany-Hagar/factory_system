import 'package:flutter/material.dart';
import '../../../manager/app_cubit.dart';
import '../../../manager/app_states.dart';
import '../../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_text.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/text_form_field.dart';

class AddCustomer extends StatelessWidget {
  const AddCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [_Title(), _Body(), _State()]);
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final s = S.current;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(isHead: true, fontSize: 18, title: s.add_customer_title),
        SizedBox(height: 16.h),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final cubit = AppCubit.get(context);
    final s = S.current;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(isHead: true, fontSize: 17, title: s.customer_name),
        SizedBox(height: 8.h),
        UTextFormField(
          hintText: s.customer_name_hint,
          controller: cubit.addTitle,
          onChanged: (p0) => cubit.checkValidate(isAddMachine: false),
        ),
        SizedBox(height: 12.h),
        CustomText(isHead: true, fontSize: 17, title: s.customer_quantity),
        SizedBox(height: 8.h),
        UTextFormField(
          hintText: s.customer_quantity_hint,
          keyboardType: TextInputType.number,
          controller: cubit.addValue,
          onChanged: (p0) => cubit.checkValidate(isAddMachine: false),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}

class _State extends StatelessWidget {
  const _State();

  @override
  Widget build(BuildContext context) {
    final cubit = AppCubit.get(context);
    final s = S.current;
    final states = cubit.machineStates;
    return BlocBuilder<AppCubit, AppStates>(
      builder:
          (context, state) => Row(
            spacing: 10.w,
            children: List.generate(
              3,
              (index) => Expanded(
                child: CustomButton(
                  enableBorderColor: false,
                  color:
                      cubit.addState == index
                          ? Color(states(s: s)[index].color)
                          : Colors.grey,
                  text: states(s: s)[index].title,
                  onPressed: () => cubit.changeAddStates(index: index),
                ),
              ),
            ),
          ),
    );
  }
}
