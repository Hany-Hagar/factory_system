import 'search_view.dart';
import '../../manager/app_cubit.dart';
import 'package:flutter/material.dart';
import '../../manager/app_states.dart';
import '../../../../../const/data.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/add/add_machine.dart';
import '../widgets/layout_view_body.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/back_ground.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/utils/dialog_services.dart';
import '../../../../../core/utils/navigator_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = AppCubit.get(context);
    return BlocListener<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is FailureState) {
          Toast.show(context, state: false, message: state.errorMessage);
        }
        if (state is SuccessState) {
          DialogServices.close(context: context);
          Toast.show(context, state: true, message: s.operation_success);
        }
      },
      child: BlocBuilder<AppCubit, AppStates>(
        builder:
            (context, state) => BackGround(
              top: _Top(),
              readOnly: true,
              onTap: () {
                NavTo.push(context: context, nextPage: SearchView());
              },
              body: LayoutViewBody(),
              floatingOnPressed:
                  () => DialogServices.add(
                    context: context,
                    body: AddMachine(),
                    onTap: () => cubit.addMachine(),
                  ),
            ),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = AppCubit.get(context);
    final color = Theme.of(context).scaffoldBackgroundColor;

    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 6.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: LinearGradient(
              colors: [Color(0xFFff6b35), Color(0xFFf7931e)],
            ),
          ),
          child: CustomText(
            isHead: true,
            title: "🏭",
            fontSize: 20,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(width: 12),
        CustomText(
          isHead: true,
          fontSize: 22,
          fontColor: color,
          title: s.factory_management_system,
        ),
        Expanded(child: SizedBox()),
        GestureDetector(
          onTap: () {
            final rect = RelativeRect.fromDirectional(
              textDirection: Directionality.of(context),
              start: 0,
              top: 0,
              end: -20,
              bottom: 0,
            );
            showMenu(
              context: context,
              position: rect,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
              items: [
                _buildPopupMenuItem(
                  title: s.lang,
                  langCode: cubit.userData.lang == arCode ? '🇺🇸' : '🇪🇬',
                  onTap: () => cubit.changeLang(),
                ),
                _buildPopupMenuItem(
                  title: s.theme,
                  icon:
                      cubit.theme == ThemeMode.light
                          ? Icons.dark_mode
                          : Icons.light_mode,
                  onTap: () => cubit.changeTheme(),
                ),
              ],
            );
          },
          child: Padding(
            padding: EdgeInsets.all(5.r),
            child: Icon(CupertinoIcons.settings, color: color, size: 28.r),
          ),
        ),
      ],
    );
  }
}

PopupMenuItem<Widget> _buildPopupMenuItem({
  required String title,
  String? langCode,
  IconData? icon,
  required VoidCallback onTap,
}) {
  return PopupMenuItem(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: CustomText(title: title, isHead: true)),
        SizedBox(width: 8.5.w),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (langCode != null)
              CustomText(isHead: true, title: langCode, fontSize: 20),
            if (icon != null) Icon(icon, size: 22),
          ],
        ),
      ],
    ),
  );
}
