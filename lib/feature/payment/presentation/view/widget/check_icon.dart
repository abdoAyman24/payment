import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/utils/app_color.dart';

class CheckIcon extends StatelessWidget {
  const CheckIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      top: -50.w,
      child: CircleAvatar(
        radius: 50.w,
        backgroundColor: const Color.fromARGB(255, 247, 246, 246),
        child: CircleAvatar(
          radius: 42.w,
          backgroundColor: Color(0xff34A853),
          child: Icon(Icons.check, color: AppColor.white, size: 50.w),
        ),
      ),
    );
  }
}
