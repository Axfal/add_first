import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduledContent extends StatelessWidget {
  const ScheduledContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 110.h,
          width: 110.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            image: const DecorationImage(
              image: AssetImage('assets/images/no_shopping.webp'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 18.h),
        Text(
          "Nothing here...",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.h),

        Text(
          "You don't have any scheduled orders.",
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 110.h),
      ],
    );
  }
}
