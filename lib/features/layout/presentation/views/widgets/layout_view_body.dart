import 'lists/machines.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LayoutViewBody extends StatelessWidget {
  const LayoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.current;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 12.r,
              top: 12.r,
              bottom: 5.r,
            ),
            child: CustomText(isHead: true, title: s.machines, fontSize: 20),
          ),
          Machines(),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
