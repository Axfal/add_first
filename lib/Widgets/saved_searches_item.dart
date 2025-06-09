import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/resources/color.dart';

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
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Row (Title + Icon)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  leftText,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                rightIcon,
                size: 22.sp,
                color: AppColor.primaryColor,
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Second Row
          Row(
            children: [
              _textRowItem(secondRowLeftText),
              SizedBox(width: 10.w),
              _textRowItem(secondRowRightText, bold: true),
            ],
          ),
          SizedBox(height: 8.h),

          // Third Row
          Row(
            children: [
              _textRowItem(thirdRowLeftText),
              SizedBox(width: 10.w),
              _textRowItem(thirdRowRightText, bold: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _textRowItem(String text, {bool bold = false}) {
    return Expanded(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13.5.sp,
          color: Colors.grey.shade800,
          fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
