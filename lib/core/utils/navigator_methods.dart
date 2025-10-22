import 'package:flutter/material.dart';
//import '../../features/layout/presentation/manager/app_cubit.dart';

class NavTo {
  static void push({required BuildContext context, required Widget nextPage}) {
    FocusScope.of(context).unfocus();
   // AppCubit.get(context).resetSearch();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => nextPage,
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0), // Start from right
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
      ),
    );
  }

  static void pushReplacement({
    required BuildContext context,
    required Widget nextPage,
  }) {
    FocusScope.of(context).unfocus();
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => nextPage,
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0), // Start from right
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
      ),
    );
  }

  static void pop({required BuildContext context}) {
    FocusScope.of(context).unfocus();
   // AppCubit.get(context).resetSearch();
    Navigator.pop(context);
  }
}
