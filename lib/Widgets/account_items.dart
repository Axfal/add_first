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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              if (isLeftIconVisible)
                Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    leftIcon,
                    size: 20.sp,
                    color: AppColor.primaryColor,
                  ),
                ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstText,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    if (secondText != null && secondText!.isNotEmpty) ...[
                      SizedBox(height: 4.h),
                      Text(
                        secondText!,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.black54,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              if (isRightIconVisible) ...[
                SizedBox(width: 10.w),
                Icon(
                  rightIcon,
                  size: 20.sp,
                  color: Colors.grey.shade400,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
