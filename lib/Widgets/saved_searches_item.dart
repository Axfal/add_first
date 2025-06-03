import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedSearchesItem extends StatelessWidget {
  final String leftText;
  final IconData rightIcon;
  final String secondRowLeftText;
  final String secondRowRightText;
  final String thirdRowLeftText;
  final String thirdRowRightText;

  const SavedSearchesItem({
    super.key,
    required this.leftText,
    required this.rightIcon,
    required this.secondRowLeftText,
    required this.secondRowRightText,
    required this.thirdRowLeftText,
    required this.thirdRowRightText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  leftText,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                rightIcon,
                size: 21.sp,
              ),
            ],
          ),
          SizedBox(height: 6.h),

          // Second Row
          Row(
            children: [
              Expanded(
                child: Text(
                  secondRowLeftText,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: Text(
                  secondRowRightText,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),

          // Third Row
          Row(
            children: [
              Expanded(
                child: Text(
                  thirdRowLeftText,
                  style: TextStyle(
                    fontSize: 15.sp,
                      color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: Text(
                  thirdRowRightText,
                  style: TextStyle(
                    fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
