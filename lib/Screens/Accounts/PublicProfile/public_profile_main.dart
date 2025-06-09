import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Widgets/product_item.dart';
import 'package:olx_app/resources/color.dart';
import 'package:olx_app/resources/exports.dart';

class PublicProfileMain extends StatelessWidget {
  const PublicProfileMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: buildAppBar(context, "Public Profile"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Profile Header
            Row(
              children: [
                Container(
                  width: 60.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // Soft translucent primary color overlay
                    color: Colors.black87.withValues(alpha: 0.1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/user_default.png',
                      fit: BoxFit.cover,
                      // Add a subtle color filter for a tinted effect
                      colorBlendMode: BlendMode.srcATop,
                    ),
                  ),
                ),

                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Abdul Rehman',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    GestureDetector(
                      onTap: () => print('View published ads'),
                      child: Text(
                        '0 published ads',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 14.h),

            /// Share Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 3,
                ),
                icon: Icon(Icons.share, size: 18.sp, color: Colors.white,),
                label: Text(
                  'Share Profile',
                  style: TextStyle(fontSize: 14.sp),
                ),
                onPressed: () {},
              ),
            ),

            SizedBox(height: 18.h),
            Divider(thickness: 0.6, color: Colors.grey.shade300),

            /// Filter Section
            SizedBox(height: 14.h),
            Text(
              "Filter by:",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.black54, size: 18.sp),
                  SizedBox(width: 8.w),
                  Text(
                    "Pakistan",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            /// Ads Grid
            Text(
              "Showing Ads",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 8.w,
                childAspectRatio: 0.64,
              ),
              itemBuilder: (context, index) {
                return ProductItem(
                  imageUrl: "",
                  price: 3000,
                  productName: "Luxury House",
                  bedsCount: 3,
                  bathsCount: 2,
                  marlasCount: null,
                  marlaKanal: "marla",
                  model: null,
                  meter: null,
                  city: "Lahore",
                  daysCount: 3,
                  onTap: () {
                    print("Product tapped!");
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
