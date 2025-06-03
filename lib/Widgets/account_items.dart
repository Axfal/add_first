import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color.dart';

class AccountItems extends StatelessWidget {
  final IconData leftIcon;
  final String firstText;
  final String? secondText;
  final IconData rightIcon;
  final bool isRightIconVisible;
  final bool isLeftIconVisible;
  final VoidCallback onTap;

  const AccountItems({
    super.key,
    required this.leftIcon,
    required this.firstText,
    this.secondText,
    required this.rightIcon,
    this.isRightIconVisible = true,
    this.isLeftIconVisible = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: isLeftIconVisible,
              child: Icon(
                leftIcon,
                size: 23.sp,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    firstText,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (secondText != null && secondText!.isNotEmpty) ...[
                    SizedBox(height: 1.h),
                    Text(
                      secondText!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(width: 4.w),
            Visibility(
              visible: isRightIconVisible,
              child: Icon(
                rightIcon,
                size: 23.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
