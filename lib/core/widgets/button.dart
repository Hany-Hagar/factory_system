import '../utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final bool isEnabled;
  final double? width;
  final double? height;
  final bool borderColorOnly;
  final Color? backgroundColor;

  final String text;
  final TextStyle? style;
  final IconData? icon;
  final double? iconSize;
  final Function()? onPressed;
  const CustomButton({
    super.key,
    this.isLoading = false,
    this.isEnabled = true,
    this.width,
    this.height,
    this.borderColorOnly = false,
    this.backgroundColor,
    required this.text,
    this.style,
    this.icon,
    this.iconSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?.h ?? 45.h,
      child:
          isLoading
              ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
              : AbsorbPointer(
                absorbing: !isEnabled,
                child: Opacity(
                  opacity: isEnabled ? 1.0 : 0.5,
                  child: _Button(
                    width: width,
                    height: height,
                    borderColorOnly: borderColorOnly,
                    backgroundColor: backgroundColor,
                    text: text,
                    style: style,
                    icon: icon,
                    iconSize: iconSize,
                    onPressed: onPressed,
                  ),
                ),
              ),
    );
  }
}

class _Button extends StatelessWidget {
  final double? width;
  final double? height;
  final bool borderColorOnly;
  final Color? backgroundColor;
  final String text;
  final TextStyle? style;
  final IconData? icon;
  final double? iconSize;
  final Function()? onPressed;

  const _Button({
    this.width,
    this.height,
    this.borderColorOnly = false,
    this.backgroundColor,
    required this.text,
    this.style,
    this.icon,
    this.iconSize,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      color: _setBgColor(context),
      minWidth: width ?? double.infinity,
      height: height?.h ?? 45.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(
          color:
              borderColorOnly
                  ? _setColor(context)
                  : backgroundColor ?? Theme.of(context).primaryColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _setIcon(context),
          Text(text, style: _setFontStyle(context)),
        ],
      ),
    );
  }

  _setBgColor(BuildContext context) {
    return borderColorOnly
        ? Colors.transparent
        : backgroundColor ?? Theme.of(context).primaryColor;
  }

  _setColor(BuildContext context) {
    return borderColorOnly
        ? backgroundColor ?? Theme.of(context).primaryColor
        : Theme.of(context).hintColor;
  }

  _setFontStyle(BuildContext context) {
    return style ??
        Styles.textStyle600.copyWith(
          color: _setColor(context),
          fontSize: 18.sp,
          overflow: TextOverflow.ellipsis,
        );
  }

  _setIcon(BuildContext context) {
    return icon != null
        ? Padding(
          padding: EdgeInsetsDirectional.only(end: 8.w),
          child: Icon(icon, size: iconSize ?? 20.sp, color: _setColor(context)),
        )
        : const SizedBox();
  }
}
