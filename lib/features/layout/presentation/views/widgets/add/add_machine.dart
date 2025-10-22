import 'package:flutter/material.dart';
import '../../../manager/app_cubit.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/text_form_field.dart';

class AddMachine extends StatelessWidget {
  const AddMachine({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final AppCubit cubit = AppCubit.get(context);

    return Column(children: [_Title(s), _Body(s, cubit)]);
  }
}

class _Title extends StatelessWidget {
  final S s;

  const _Title(this.s);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(isHead: true, title: "🏭", fontSize: 35),
        CustomText(isHead: true, title: s.add_machine_title, fontSize: 18),
        CustomText(isHead: true, title: s.add_machine_sub_title, fontSize: 14),
        SizedBox(height: 10.h),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final S s;
  final AppCubit cubit;
  const _Body(this.s, this.cubit);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(isHead: true, title: s.machine_name, fontSize: 14),
        SizedBox(height: 6.h),
        UTextFormField(
          hintText: s.machine_hint,
          controller: cubit.addTitle,
          onChanged: (p0) => cubit.checkValidate(isAddMachine: true),
        ),
      ],
    );
  }
}
