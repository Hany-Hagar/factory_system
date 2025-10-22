import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  // Theme-related variables
  static var primaryColor = Colors.deepOrange;
  static var fontColor = Colors.white;
  static var lightFontColor = Colors.black;
  static var nightFontColor = Colors.white;

  static Color red = CupertinoColors.systemRed;
  //static Color green = Color(0xff06d6a0);
  static Color green = CupertinoColors.activeGreen;

  static const fontOpacityColor = Colors.black45;
  static const fontType = 'OpenSans';

  // Dynamic TextStyle Getters
  static TextStyle get textStyle100 => _baseStyle(FontWeight.w100);
  static TextStyle get textStyle200 => _baseStyle(FontWeight.w200);
  static TextStyle get textStyle300 => _baseStyle(FontWeight.w300);
  static TextStyle get textStyle400 => _baseStyle(FontWeight.w400);
  static TextStyle get textStyle500 => _baseStyle(FontWeight.w500);
  static TextStyle get textStyle600 => _baseStyle(FontWeight.w600);
  static TextStyle get textStyle700 => _baseStyle(FontWeight.w700);
  static TextStyle get textStyle800 => _baseStyle(FontWeight.w800);
  static TextStyle get textStyle900 => _baseStyle(FontWeight.w900);
  static TextStyle get textStyleBold => _baseStyle(FontWeight.bold);

  static TextStyle _baseStyle(FontWeight weight) {
    return TextStyle(
      fontWeight: weight,
      color: fontColor,
      overflow: TextOverflow.ellipsis,
      fontFamily: fontType,
    );
  }
}
