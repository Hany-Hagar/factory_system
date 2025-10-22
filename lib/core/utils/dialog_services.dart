import 'styles.dart';
import '../widgets/button.dart';
import '../../generated/l10n.dart';
import '../widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/layout/presentation/manager/app_cubit.dart';
import '../../features/layout/presentation/manager/app_states.dart';

class DialogServices {
  static void add({
    required Widget body,
    required Function()? onTap,
    required BuildContext context,
  }) {
    final s = S.current;
    _show(
      icon: Icons.save,
      title: s.save,
      context: context,
      body: body,
      saveTap: onTap,
      isDelete: false,
    );
  }

  static void delete({
    required BuildContext context,
    required Function()? onTap,
  }) {
    final s = S.current;
    _show(
      icon: Icons.delete,
      title: s.delete,
      context: context,
      body: _DeleteBody(),
      saveTap: onTap,
      isDelete: true,
    );
  }

  static void _show({
    required bool isDelete,
    required IconData icon,
    required String title,
    required Widget body,
    required Function()? saveTap,
    required BuildContext context,
  }) {
    final cubit = AppCubit.get(context);

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          insetPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              top: 16.h,
              bottom: 10.h,
            ),
            child: BlocBuilder<AppCubit, AppStates>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    body,
                    SizedBox(height: 20.h),
                    _Actions(
                      isEnabled: isDelete ? true : !cubit.emptyAddData,
                      icon: icon,
                      title: title,
                      onTap: saveTap,
                    ),
                    SizedBox(height: 5.h),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  static void close({required BuildContext context}) {
    Navigator.pop(context);
    AppCubit.get(context).resetAddData();
  }
}

class _DeleteBody extends StatelessWidget {
  const _DeleteBody();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      children: [
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(137, 255, 139, 128),
          ),
          child: Icon(Icons.warning, color: Colors.redAccent, size: 30.r),
        ),
        SizedBox(height: 10.h),
        CustomText(isHead: true, title: s.delete_dialog_title, fontSize: 17),
        SizedBox(height: 5.h),
        CustomText(isHead: true, title: s.delete_dialog_content, fontSize: 17),
      ],
    );
  }
}

class _Actions extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isEnabled;
  final Function()? onTap;
  const _Actions({
    required this.isEnabled,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.current;

    return Row(
      children: [
        Expanded(
          child: CustomButton(
            isEnabled: isEnabled,
            icon: icon,
            text: title,
            onPressed: onTap,
            backgroundColor: Styles.green,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: CustomButton(
            text: s.close,
            icon: Icons.close,
            backgroundColor: Styles.red,
            onPressed: () => DialogServices.close(context: context),
          ),
        ),
      ],
    );
  }
}
