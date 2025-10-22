// ignore_for_file: deprecated_member_use
import '../widgets/custom_text.dart';
import 'package:flutter/material.dart';


class Toast {
  static void show(
    BuildContext context, {
    required bool state,
    String? message,
  }) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            bottom: 50,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color:
                      state
                          ? Colors.green.withOpacity(0.9)
                          : Colors.red.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: CustomText(
                    isHead: true,
                    title:
                        message ??
                        (state ? "Success!" : "Something went wrong!"),
                    fontSize: 14,
                    fontColor: Theme.of(context).scaffoldBackgroundColor,
                    maxLines: 5,
                  ),
                ),
              ),
            ),
          ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(Duration(seconds: state ? 2 : 3)).then((_) {
      overlayEntry.remove();
    });
  }
}
