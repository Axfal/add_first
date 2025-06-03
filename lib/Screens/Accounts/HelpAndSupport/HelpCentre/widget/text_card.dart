import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextCard extends StatelessWidget {
  final String boldText;
  final String buttonText;
  final String description;
  final VoidCallback onButtonTap;
  final int messageCount;

  const TextCard({
    super.key,
    required this.boldText,
    required this.buttonText,
    required this.description,
    required this.onButtonTap,
    required this.messageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Bold Text
          Text(
            boldText,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black54
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),

          // Clickable Button Text
          GestureDetector(
            onTap: onButtonTap,
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.blue,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 13.sp,
                      color: Colors.black54
                  ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 2.w),
              Icon(Icons.messenger, size: 18.sp),
              SizedBox(width: 4.w),
              Text(
                '$messageCount',
                style: TextStyle(fontSize: 12.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
