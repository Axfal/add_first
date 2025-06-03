import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreenItem extends StatelessWidget {
  final String firstText;
  final String? secondText;
  final bool isSwitchVisible;
  final bool switchValue;
  final ValueChanged<bool> onSwitchChanged;
  final VoidCallback onTap;

  const NotificationScreenItem({
    super.key,
    required this.firstText,
    this.secondText,
    this.isSwitchVisible = true,
    required this.switchValue,
    required this.onSwitchChanged,
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    firstText,
                    style: TextStyle(
                      fontSize: 17.sp,
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
              visible: isSwitchVisible,
              child: Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: switchValue,
                  onChanged: onSwitchChanged,
                  activeColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  inactiveThumbColor: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
