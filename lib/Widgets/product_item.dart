import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Screens/ProductDetail/product_detail.dart';
import '../resources/color.dart';

class ProductItem extends StatelessWidget {
  final String? imageUrl;
  final double? price;
  final String productName;
  final String marlaKanal;
  final int? bedsCount;
  final int? bathsCount;
  final int? marlasCount;
  final int? model;
  final int? meter;
  final String city;
  final double daysCount;
  final VoidCallback onTap;

  const ProductItem({
    super.key,
    required this.imageUrl,
    this.price,
    required this.productName,
    this.bedsCount,
    this.bathsCount,
    this.marlasCount,
    required this.marlaKanal,
    this.model,
    this.meter,
    required this.city,
    required this.daysCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180.w,
        margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image Section
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              child: SizedBox(
                height: 120.h,
                width: double.infinity,
                child: (imageUrl != null && imageUrl!.isNotEmpty)
                    ? (imageUrl!.startsWith('http')
                    ? FadeInImage.assetNetwork(
                  placeholder: 'assets/placeholder.png',
                  image: imageUrl!,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) =>
                  const Center(child: Icon(Icons.broken_image, color: Colors.grey, size: 30)),
                )
                    : Image.asset(imageUrl!, fit: BoxFit.cover))
                    : const Center(child: Icon(Icons.broken_image, size: 30, color: Colors.grey)),
              ),
            ),

            /// Info Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Price & Favorite Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rs. ${price?.toStringAsFixed(0) ?? "N/A"}',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Icon(Icons.favorite_border, size: 16.sp, color: Colors.grey.shade600),
                    ],
                  ),

                  SizedBox(height: 4.h),

                  /// Product Name
                  Text(
                    productName,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 4.h),

                  /// Beds, Baths, Marlas
                  if (bedsCount != null || bathsCount != null || marlasCount != null)
                    Row(
                      children: [
                        if (bedsCount != null)
                          _infoIconText(Icons.bed, '$bedsCount'),
                        if (bathsCount != null)
                          _infoIconText(Icons.bathtub_outlined, '$bathsCount'),
                        if (marlasCount != null)
                          _infoIconText(Icons.grid_view_rounded, '$marlasCount $marlaKanal'),
                      ],
                    ),

                  /// Car Model & Meter
                  if (model != null && meter != null) ...[
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(Icons.directions_car, size: 12.sp, color: Colors.grey.shade600),
                        SizedBox(width: 4.w),
                        Text('$model • ${meter}km', style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade700)),
                      ],
                    ),
                  ],

                  SizedBox(height: 6.h),

                  /// City & Time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(city, style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade600)),
                      Text('${daysCount.toInt()}d ago', style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade600)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoIconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 12.sp, color: Colors.grey.shade600),
        SizedBox(width: 3.w),
        Text(text, style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade700)),
        SizedBox(width: 6.w),
      ],
    );
  }
}
