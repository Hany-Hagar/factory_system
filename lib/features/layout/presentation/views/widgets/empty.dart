import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum EState { list, search, card }

class Empty extends StatelessWidget {
  final EState state;
  const Empty({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      EState.list => const _List(),
      EState.search => const _Search(),
      EState.card => const _Card(),
    };
  }
}

class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.17),
        LottieBuilder.asset(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.3,
          "assets/lotties/empty_list.json",
        ),
        CustomText(isHead: true, fontSize: 20, title: S.of(context).empty_list),
      ],
    );
  }
}

class _Search extends StatelessWidget {
  const _Search();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.22),
        LottieBuilder.asset(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.3,
          "assets/lotties/No Search Results.json",
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.r, left: 10.r, right: 10.r, bottom: 14.r),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          strokeWidth: 1.2,
          radius: Radius.circular(8.r),
          padding: EdgeInsets.all(10.r),
          color: Theme.of(context).hintColor,
        ),
        child: Center(
          child: CustomText(
            isHead: true,
            fontSize: 20,
            title: S.of(context).empty_list,
          ),
        ),
      ),
    );
  }
}
