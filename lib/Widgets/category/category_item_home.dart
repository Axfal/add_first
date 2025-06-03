// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:olx_app/resources/exports.dart';

class CategoryItem extends StatelessWidget {
  final String categoryName;
  final VoidCallback onTap;
  final String iconPath;

  const CategoryItem({
    super.key,
    required this.categoryName,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70.w,
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  iconPath,
                  fit: BoxFit.cover,
                  width: 60.w,
                  height: 60.w,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.broken_image, size: 28.w),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Flexible(
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  letterSpacing: 0.3,
                  height: 1.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
