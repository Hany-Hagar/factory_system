// ignore_for_file: deprecated_member_use
import '../../manager/app_cubit.dart';
import '../../manager/app_states.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/lists/general_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/back_ground.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/utils/navigator_methods.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    var cubit = AppCubit.get(context);
    final FocusNode focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
    return BlocBuilder<AppCubit, AppStates>(
      builder:
          (context, state) => BackGround(
            top: _Top(),
            body: BlocBuilder<AppCubit, AppStates>(
              builder:
                  (context, state) =>
                      cubit.searchOpen
                          ? SingleChildScrollView(child: GeneralSearch())
                          : SizedBox(),
            ),
            focusNode: focusNode,
            hintText: s.searchHint,
            controller: cubit.searchValue,
            onChanged: (p0) => cubit.generalSearch(),
          ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

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
        CustomText(isHead: true, title: s.search_view),
        Expanded(flex: 3, child: SizedBox()),
      ],
    );
  }
}
