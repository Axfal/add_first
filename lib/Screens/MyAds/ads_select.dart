// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Screens/MyAds/choose_ad.dart';
import 'package:olx_app/Screens/MyAds/widgets/filters_item.dart';
import 'package:olx_app/Widgets/bottom_slide_page.dart';
import 'package:olx_app/resources/color.dart';
import 'package:olx_app/resources/exports.dart';

class AdsSelect extends StatelessWidget {
  const AdsSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: buildAppBar(context, "Filter", actions: [Icon(Icons.more_vert, color: Colors.white,), SizedBox(width: 15,
      )]),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 16.h),
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, size: 24.sp, color: Colors.grey[600]),
                    hintText: 'Search...',
                    hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                  ),
                  style: TextStyle(fontSize: 15.sp, color: Colors.black87),
                ),
              ),
              SizedBox(height: 24.h),
          
              // Filters list
              Expanded(
                child: ListView.separated(
                  itemCount: 2,
                  separatorBuilder: (_, __) => Divider(height: 1.h, color: Colors.grey.shade300),
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return FiltersItem(
                          title: "Ad status",
                          subtitle: "Active Ads",
                          onTap: () {
                            Navigator.of(context).push(BottomSlidePage(page: const ChooseAd()));
                          },
                        );
                      case 1:
                        return FiltersItem(
                          title: "Category",
                          subtitle: "No category selected",
                          onTap: () {},
                        );
                      default:
                        return const SizedBox();
                    }
                  },
                ),
              ),
          
              // Apply button
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: () {
                      // Apply filters
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      elevation: 3,
                      shadowColor: Colors.black45,
                    ),
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
