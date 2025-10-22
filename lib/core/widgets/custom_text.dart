// ignore_for_file: deprecated_member_use

import '../utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final bool isHead;
  final String title;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? fontSize;
  final Color? fontColor;
  final TextOverflow? overflow;
  final double? opacity;
  final TextStyle? style;

  const CustomText({
    super.key,
    required this.isHead,
    required this.title,
    this.maxLines,
    this.textAlign,
    this.fontSize,
    this.fontColor,
    this.overflow,
    this.opacity,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    var size = fontSize ?? (isHead ? 25 : 14);

    // اختر اللون
    final baseColor = fontColor ?? Theme.of(context).hintColor;

    return Text(
      title,
      maxLines: maxLines ?? (isHead ? 1 : 3),
      textAlign: textAlign,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: style ?? (isHead ? Styles.textStyle800 : Styles.textStyle600).copyWith(
        color: baseColor.withOpacity(opacity ?? (isHead ? 1 : 0.66)),
        fontSize: size.sp,
      ),
    );
  }
}
