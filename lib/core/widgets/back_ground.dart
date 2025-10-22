// ignore_for_file: deprecated_member_use, unused_element_parameter

import 'text_form_field.dart';
import 'package:glass/glass.dart';
import '../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/layout/presentation/manager/app_cubit.dart';
import '../../features/layout/presentation/manager/app_states.dart';

class BackGround extends StatelessWidget {
  final Widget? top;
  final Widget body;
  final bool? readOnly;
  final String? hintText;
  final Function()? onTap;
  final FocusNode? focusNode;
  final Function(String?)? onChanged;
  final Function()? floatingOnPressed;
  final TextEditingController? controller;

  const BackGround({
    super.key,
    this.top,
    this.onTap,
    this.hintText,
    this.readOnly,
    this.onChanged,
    this.focusNode,
    this.controller,
    required this.body,
    this.floatingOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),

        // المحتوى الرئيسي
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              if (top != null)
                _Top(
                  top: top!,
                  onTap: onTap,
                  hintText: hintText,
                  onChanged: onChanged,
                  focusNode: focusNode,
                  controller: controller,
                  readOnly: readOnly ?? false,
                ),
              Expanded(child: body),
            ],
          ),
          floatingActionButton: BlocBuilder<AppCubit, AppStates>(
            builder:
                (context, state) =>
                    controller == null
                        ? __FloatingActionButton(floatingOnPressed)
                        : cubit.searchOpen
                        ? SizedBox()
                        : floatingOnPressed == null
                        ? SizedBox()
                        : __FloatingActionButton(floatingOnPressed),
          ),
        ).asGlass(),
      ],
    );
  }
}

class _Top extends StatelessWidget {
  final Widget top;
  final bool? readOnly;
  final String? hintText;
  final Function()? onTap;
  final FocusNode? focusNode;
  final Function(String?)? onChanged;
  final TextEditingController? controller;
  const _Top({
    this.onTap,
    this.onChanged,
    required this.top,
    required this.readOnly,
    required this.hintText,
    required this.focusNode,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: MediaQuery.paddingOf(context).top,
        start: 10.r,
        end: 10.r,
        bottom: 10.r,
      ),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(12.r),
          bottomStart: Radius.circular(12.r),
        ),
      ),
      child: Column(
        children: [
          top,
          SizedBox(height: 10.h),
          BlocBuilder<AppCubit, AppStates>(
            builder:
                (context, state) => UTextFormField(
                  onTap: onTap,
                  focusNode: focusNode,
                  onChanged: onChanged,
                  readOnly: readOnly ?? false,
                  keyboardType: TextInputType.text,
                  prefixIcon: CupertinoIcons.search,
                  hintText: hintText ?? s.searchHint,
                  controller: controller ?? TextEditingController(),
                  suffixTap: () => AppCubit.get(context).resetSearch(),
                  suffixIcon:
                      controller?.text.isNotEmpty ?? false ? Icons.close : null,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
          ),
        ],
      ),
    );
  }
}

class __FloatingActionButton extends StatelessWidget {
  final Function()? floatingOnPressed;
  const __FloatingActionButton(this.floatingOnPressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.r),
      child: FloatingActionButton(
        backgroundColor: Styles.green.withOpacity(0.8),
        onPressed: floatingOnPressed,
        child: Icon(Icons.add, size: 26.r, color: Theme.of(context).hintColor),
      ),
    );
  }
}
