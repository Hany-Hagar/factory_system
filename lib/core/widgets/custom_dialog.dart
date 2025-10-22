
import '../utils/styles.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultDialog extends StatelessWidget {
  final DialogState state;
  final String text;

  const ResultDialog({super.key, required this.state, required this.text});

  @override
  Widget build(BuildContext context) {
    String icon;
    Color color;

    switch (state) {
      case DialogState.success:
        icon = "assets/lotties/Success.json";
        color = Colors.green;
        break;
      case DialogState.failure:
        icon = "assets/lotties/Error.json";
        color = Colors.redAccent;

        break;
      case DialogState.alert:
        icon = "assets/lotties/Alert.json";
        color = Colors.grey;

        break;
    }

    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [

          Container(
            height: 200,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 12.sp),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 22.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color:Color(0xfff7f7fc),
            ),
            child: Scaffold(
              body: Center(
                child: Text(
                  text,
                  style: Styles.textStyle800.copyWith(
                    color: color,
                    fontSize: 18.sp,
                  ),
                  maxLines: 6,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -70.r),
            child: Lottie.asset(
              icon,
              animate: true,
              fit: BoxFit.fill,
              width: 100.r,
            ),
          ),
        ],
      ),
    );
  }
}

enum DialogState { alert, success, failure }
