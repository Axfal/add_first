import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Screens/MyAds/choose_ad.dart';
import 'package:olx_app/Screens/MyAds/widgets/filters_item.dart';
import 'package:olx_app/Widgets/bottom_slide_page.dart';

class AdsSelect extends StatelessWidget {
  const AdsSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 4.w, right: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, size: 30),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Filters',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Clear all",
                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, size: 20.sp),
                  SizedBox(width: 10.w),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle: TextStyle(fontWeight: FontWeight.normal),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          FiltersItem(
            title: "Ad status",
            subtitle: "Active Ads",
            onTap: () {
              Navigator.of(context).push(BottomSlidePage(page: const ChooseAd()));
            },
          ),
          const Divider(),
          FiltersItem(
            title: "Category",
            subtitle: "No category selected",
            onTap: () {},
          ),
          const Divider(),

          const Spacer(),
          Center(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                  ),
                  onPressed: () {
                  },
                  child: Text(
                    'Apply',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14.sp),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
