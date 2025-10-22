import '../utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final double width;
  final double height;
  final Color color;
  final bool enableDifferentBg;
  final Color? differentBg;
  final double borderRadius;
  final double borderWidth;
  final bool enableBorderColor;
  final bool enableCompleteStyle;
  final TextStyle? style;
  final double padding;
  final IconData? icon;
  final bool enableIcon;
  final bool enableText;
  final bool enableDifferentTextColor;
  final Color? differentTextColor;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.text = "Click Me",
    this.width = 0.1,
    this.height = 40,
    this.color = Colors.deepOrange,
    
    this.borderRadius = 10.0,
    this.borderWidth = 2.0,
    this.enableBorderColor = true,
    this.enableCompleteStyle = false,
    this.style = const TextStyle(),
    this.padding = 0.0,
    this.icon,
    this.enableIcon = false,
    this.enableText = true,
    this.differentBg = Colors.transparent, 
    this.enableDifferentBg = false,
    this.enableDifferentTextColor = false,
    this.differentTextColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    var textColor = enableDifferentTextColor ? differentTextColor :enableBorderColor ? color : Styles.fontColor;
    Text texxt = Text(
      text,
      style:
          enableCompleteStyle
              ? style
              : Styles.textStyle700.copyWith(
                fontSize: 17.sp,
                color: textColor,
              ),
    );
    Icon icoon = Icon(
      icon,
      size: 17.sp,
      color: textColor,
    );
    return MaterialButton(
      elevation: 0,
      padding: EdgeInsets.symmetric(
        vertical: (padding * 0.2).h,
        horizontal: (padding).w,
      ),
      minWidth: width.sw,
      height: height.h,
      onPressed: onPressed,
      color: enableDifferentBg? differentBg: enableBorderColor ? Colors.transparent : color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius.r),
        side: BorderSide(
          color: enableBorderColor ? color : Colors.transparent,
          width: borderWidth,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          if (enableIcon && enableText)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icoon, SizedBox(width: 2.w), texxt],
            ),
          if (!enableIcon && enableText) texxt,
          if (enableIcon && !enableText) icoon,
        ],
      ),
    );
  }
}
