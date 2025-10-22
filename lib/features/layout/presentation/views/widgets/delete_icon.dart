import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/dialog_services.dart';

class DeleteIcon extends StatelessWidget {
  final double size;
  final Color? color;
  final Function() deleteTap;
  const DeleteIcon({
    super.key,
    this.size = 24,
    required this.deleteTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:
          () => DialogServices.delete(context: context, onTap: deleteTap),
      icon: Icon(
        CupertinoIcons.delete,
        size: size.r,
        color: color ?? Theme.of(context).hintColor,
      ),
    );
  }
}
