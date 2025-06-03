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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  color: Colors.grey.shade100,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  child: Row(
                    children: [
                      Container(
                        width: 70.w,
                        height: 70.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: onThreeDotsTap,
                                  child: Icon(Icons.more_vert, size: 18.sp),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              'Rs.$price',
                              style: TextStyle(fontSize: 12.sp,color: AppColor.primaryColor),
                            ),
                            Text(
                              category,
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Active from 29 Dec to 28 Jan',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(Icons.remove_red_eye_outlined, size: 16.w),
                      SizedBox(width: 4.w),
                      Text(
                        '45',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Views',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      SizedBox(width: 18.w),
                      Icon(Icons.person, size: 16.w),
                      SizedBox(width: 4.w),
                      Text(
                        '0',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Leads',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color:AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Active',
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    ),
                  ),
                  // Buttons Row
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.black, width: 1.w),
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Text(
                              'Edit',
                              style: TextStyle(fontSize: 12.sp, color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: AppColor.primaryColor,
                              side: BorderSide(color: AppColor.primaryColor),
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Text(
                              'Sell faster now',
                              style: TextStyle(fontSize: 12.sp, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
