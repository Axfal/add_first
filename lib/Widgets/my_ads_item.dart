import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color.dart';

class MyAdsItem extends StatelessWidget {
  final String name;
  final int price;
  final VoidCallback onTap;
  final VoidCallback onThreeDotsTap;
  final String category;
  final String image;

  const MyAdsItem({
    required this.name,
    required this.price,
    required this.category,
    required this.onTap,
    required this.onThreeDotsTap,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.r),
      color: Colors.white,
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.r),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row with Image, Name, and Menu
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(
                      image,
                      width: 72.w,
                      height: 72.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name and menu icon row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: onThreeDotsTap,
                              borderRadius: BorderRadius.circular(20),
                              child: Padding(
                                padding: EdgeInsets.all(4.w),
                                child: Icon(
                                  Icons.more_vert,
                                  size: 20.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'Rs. $price',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          category,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              // Active date text
              Text(
                'Active from 29 Dec to 28 Jan',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey[600],
                ),
              ),

              SizedBox(height: 14.h),

              // Views and Leads row
              Row(
                children: [
                  Icon(Icons.remove_red_eye_outlined, size: 18.sp, color: Colors.grey[700]),
                  SizedBox(width: 6.w),
                  Text(
                    '45',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    'Views',
                    style: TextStyle(fontSize: 13.sp, color: Colors.grey[700]),
                  ),
                  SizedBox(width: 24.w),
                  Icon(Icons.person, size: 18.sp, color: Colors.grey[700]),
                  SizedBox(width: 6.w),
                  Text(
                    '0',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    'Leads',
                    style: TextStyle(fontSize: 13.sp, color: Colors.grey[700]),
                  ),
                ],
              ),

              SizedBox(height: 14.h),

              // Status badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  'Active',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: 18.h),

              // Buttons row
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.black87, width: 1.2.w),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        'Edit',
                        style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        'Sell faster now',
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
