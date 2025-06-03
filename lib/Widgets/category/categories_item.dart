// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';
import 'package:olx_app/resources/exports.dart';

class CategoriesItemCard extends StatelessWidget {
  final bool imageVisible;
  final bool iconVisible;
  final double textSize;
  final String text;
  final IconData? icon;
  final String? iconPath;
  final VoidCallback? onTap;

  const CategoriesItemCard({
    super.key,
    this.imageVisible = true,
    this.iconVisible = true,
    this.textSize = 16,
    required this.text,
    this.icon,
    this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(2, 4),
            spreadRadius: 2,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24.r),
        splashColor: Colors.grey.shade100,
        child: Row(
          children: [
            if (imageVisible)
              Container(
                width: 52.w,
                height: 52.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade100,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (iconPath != null)
                        Image.network(
                          iconPath!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              Icon(Icons.broken_image, size: 24.w),
                        )
                      else
                        Center(
                          child: Icon(
                            Icons.image_outlined,
                            size: 26.w,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 0.6, sigmaY: 0.6),
                        child: Container(
                          color: Colors.white.withOpacity(0.15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (imageVisible) SizedBox(width: 16.w),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.urbanist(
                  fontSize: textSize.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                  color: Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (iconVisible && icon != null) ...[
              SizedBox(width: 14.w),
              Icon(
                icon,
                size: 22.w,
                color: Colors.grey.shade600,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
