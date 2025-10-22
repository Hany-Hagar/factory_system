// ignore_for_file: deprecated_member_use

import '../utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UTextFormField extends StatelessWidget {
  final double? width;
  final double? height;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final InputBorder? border;
  final Color? backgroundColor;
  final int maxLines;
  final int? maxLength;
  final EdgeInsets? padding;
  final IconData? prefixIcon;
  final Function()? prefixTap;
  final String? hintText;
  final String? labelText;
  final TextStyle? inputStyle;
  final TextStyle? hintStyle;
  final IconData? suffixIcon;
  final Function()? suffixTap;
  final bool readOnly;
  final bool autocorrect;
  final TextAlign? textAlign;
  final Function()? onTap;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  const UTextFormField({
    super.key,
    this.width,
    this.height,
    this.obscureText = false,
    required this.controller,
    this.keyboardType,
    this.border,
    this.backgroundColor,
    this.maxLines = 1,
    this.maxLength,
    this.padding,
    this.prefixIcon,
    this.prefixTap,
    this.hintText,
    this.labelText,
    this.inputStyle,
    this.hintStyle,
    this.suffixIcon,
    this.suffixTap,
    this.readOnly = false,
    this.autocorrect = true,
    this.textAlign,
    this.onTap,
    this.onFieldSubmitted,
    this.onChanged,
    this.onSaved,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w ?? double.infinity,
      height: height?.h ?? 40.h,
      child: TextFormField(
        onTap: onTap,
        focusNode: focusNode,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: _setBorder(context: context),
          enabledBorder: _setBorder(context: context),
          filled: true,
          fillColor: backgroundColor ?? Colors.transparent,
          prefixIcon: _setPrefixIcon(),
          hintText: hintText,
          labelText: labelText,
          hintStyle: hintStyle ?? _FontStyle.hint(context),
          suffixIcon: _setSuffixIcon(),
          contentPadding: _setContentPadding(),
          errorStyle: Styles.textStyle500.copyWith(
            color: Colors.red,
            fontSize: 14.sp,
          ),
        ),
        style: inputStyle ?? _FontStyle.input(context),
        maxLines: maxLines,
        maxLength: maxLength,
        readOnly: readOnly,
        textAlign: textAlign ?? TextAlign.start,
        autocorrect: autocorrect,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        validator:
            (value) => _Validate.setValidator(
              keyboardType: keyboardType ?? TextInputType.text,
              value: value,
            ),
      ),
    );
  }

  _setBorder({required BuildContext context}) {
    return border ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            width: 0.5,
            color: Theme.of(context).hintColor,
          ),
        );
  }

  _setContentPadding() {
    return padding ??
        EdgeInsets.symmetric(
          horizontal: 14.r,
          vertical: maxLines > 1 ? 10.r : 0,
        );
  }

  _setPrefixIcon() {
    return prefixIcon != null
        ? GestureDetector(onTap: prefixTap, child: Icon(prefixIcon))
        : null;
  }

  _setSuffixIcon() {
    return suffixIcon != null
        ? GestureDetector(onTap: suffixTap, child: Icon(suffixIcon))
        : null;
  }
}

class _FontStyle {
  static TextStyle hint(BuildContext context) => Styles.textStyle500.copyWith(
    color: Theme.of(context).hintColor.withOpacity(0.66),
    fontSize: 15.sp,
  );
  static TextStyle input(BuildContext context) => Styles.textStyle500.copyWith(
    color: Theme.of(context).hintColor,
    fontSize: 18.sp,
  );
}

class _Validate {
  final errorMessage = "";
  static String? setValidator({
    required TextInputType keyboardType,
    required String? value,
  }) {
    if (keyboardType == TextInputType.emailAddress) {
      return _emailValidator(value);
    } else if (keyboardType == TextInputType.visiblePassword) {
      return _passwordValidator(value);
    } else if (keyboardType == TextInputType.phone) {
      return _phoneNumberValidator(value);
    } else if (keyboardType == TextInputType.streetAddress) {
      return _streetAddressValidator(value);
    } else if (keyboardType == TextInputType.url) {
      return _urlValidator(value);
    } else if (keyboardType == TextInputType.number) {
      return _numberValidator(value);
    } else {
      return _textValidator(value);
    }
  }

  static String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    // Regular expression for basic email validation
    final emailRegex = RegExp(
      r'^([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$',
      caseSensitive: false,
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  static String? _textValidator(value) {
    if (value.isEmpty) {
      return 'This field cannot be left empty';
    } else {
      return null;
    }
  }

  static String? _passwordValidator(String? value, {bool isPassword = false}) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    if (isPassword) {
      // Regular expression for strong password validation
      final passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
      );

      if (!passwordRegex.hasMatch(value)) {
        return 'weak-password';

        // return 'Password must be at least 8 characters long, include uppercase and lowercase letters, a digit, and a special character';
      }
    }

    return null;
  }

  static String? _phoneNumberValidator(
    String? value, {
    bool isPhoneNumber = false,
  }) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    if (isPhoneNumber) {
      // Regular expression for phone number validation
      final phoneRegex = RegExp(
        r'^\+?[1-9]\d{1,14}$', // Basic regex for international phone numbers
        caseSensitive: false,
      );

      if (!phoneRegex.hasMatch(value)) {
        return 'Please enter a valid phone number';
      }
    }

    return null;
  }

  static String? _streetAddressValidator(String? value) {
    // Check if the value is null or empty
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    // Regular expression to validate address format
    final addressRegex = RegExp(r'^[\d\w\s,.-]+$');
    if (!addressRegex.hasMatch(value)) {
      return 'Please enter a valid address';
    }

    // Optionally, check the length of the address
    if (value.length < 5 || value.length > 100) {
      return 'Address should be between 5 and 100 characters';
    }

    return null;
  }

  static String? _urlValidator(String? value) {
    // Check if the value is null or empty
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    // Regular expression to validate URL format
    final urlRegex = RegExp(
      r"^(https?:\/\/)?([\w-]+\.)+[\w-]+(\/[\w-]*)*(\?[^\s]*)?$",
      caseSensitive: false,
    );

    if (!urlRegex.hasMatch(value)) {
      return 'Please enter a valid URL';
    }

    return null;
  }

  static String? _numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be left empty';
    }

    final numberRegex = RegExp(r'^[0-9]+$');
    if (!numberRegex.hasMatch(value)) {
      return 'Please enter only numbers';
    }

    final number = int.tryParse(value);
    if (number == null || number == 0) {
      return 'Enter Vaild Value';
    }

    return null;
  }
}
