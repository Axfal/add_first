import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Screens/ProductDetail/product_detail.dart';
import 'package:olx_app/resources/color.dart';

class FavouritesProductItem extends StatelessWidget {
  final ImageProvider image;
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

  const FavouritesProductItem({
    super.key,
    required this.image,
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductDetailPage()),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(18.r),
              child: Image(
                image: image,
                width: 120.w,
                height: 140.h,
                fit: BoxFit.cover,
              ),
            ),

            // Details
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(14.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Price and Heart
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: Icon(
                            Icons.favorite_rounded,
                            color: Colors.redAccent,
                            size: 22.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),

                    // Title
                    Text(
                      'Rs. ${price?.toStringAsFixed(0) ?? ''}',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.h),

                    // Bed, Bath, Area
                    if (bedsCount != null ||
                        bathsCount != null ||
                        marlasCount != null)
                      Row(
                        children: [
                          if (bedsCount != null)
                            _infoIcon(Icons.bed, '$bedsCount'),
                          if (bathsCount != null)
                            _infoIcon(Icons.bathtub, '$bathsCount'),
                          if (marlasCount != null)
                            _infoIcon(
                                Icons.square_foot, '$marlasCount $marlaKanal'),
                        ],
                      ),
                    if (model != null && meter != null) ...[
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          _infoIcon(Icons.directions_car_filled_outlined,
                              '$model • ${meter}km'),
                        ],
                      ),
                    ],

                    SizedBox(height: 8.h),

                    // City and Days
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 14.sp, color: Colors.grey[600]),
                            SizedBox(width: 4.w),
                            Text(
                              city,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${daysCount.toInt()}d ago',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoIcon(IconData icon, String value) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Row(
        children: [
          Icon(icon, size: 16.sp, color: Colors.grey.shade700),
          SizedBox(width: 4.w),
          Text(
            value,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
