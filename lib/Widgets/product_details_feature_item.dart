import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRowContainer extends StatelessWidget {
  final String firstText;
  final String secondText;
  final bool isIconVisible;
  final IconData? icon;
  final Color? backgroundColor;

  const CustomRowContainer({
    super.key,
    required this.firstText,
    required this.secondText,
    this.isIconVisible = true,
    this.icon,
    this.backgroundColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: backgroundColor?.withOpacity(0.2),
      ),

      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isIconVisible) ...[
            Icon(
              icon ?? Icons.info,
              size: 18.w,
              color: Colors.black,
            ),
            SizedBox(width: 6.w),
          ],
          Expanded(
            flex: 4,
            child: Text(
              firstText,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
              ),
              overflow: TextOverflow.visible,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            flex: 2,
            child: Text(
              secondText,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
