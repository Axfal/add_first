import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Screens/ProductDetail/product_detail.dart';

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
        width: double.infinity.w,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.w,
              height: 110.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rs.$price',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.favorite_outline,
                            size: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      productName,
                      style: TextStyle(
                        fontSize: 13.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),

                    if (bedsCount != null || bathsCount != null || marlasCount != null)
                      Row(
                        children: [
                          if (bedsCount != null) ...[
                            Icon(Icons.bed, size: 11.h),
                            SizedBox(width: 6.w),
                            Text(
                              '$bedsCount',
                              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 7.w),
                          ],
                          if (bathsCount != null) ...[
                            Icon(Icons.bathtub_outlined, size: 11.h),
                            SizedBox(width: 6.w),
                            Text(
                              '$bathsCount',
                              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 7.w),
                          ],
                          if (marlasCount != null) ...[
                            Icon(Icons.grid_view, size: 11.h),
                            SizedBox(width: 6.w),
                            Text(
                              '$marlasCount $marlaKanal',
                              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ],
                      ),

                    SizedBox(height: 4.h),

                    if (model != null && meter != null)
                      Row(
                        children: [
                          Icon(Icons.drive_eta_outlined, size: 11.h),
                          SizedBox(width: 6.w),
                          Text(
                            '$model - $meter km',
                            style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                    SizedBox(height: 4.h),

                    Text(
                      city,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '$daysCount days ago',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.black54,
                      ),
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
}