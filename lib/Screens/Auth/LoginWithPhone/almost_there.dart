import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Screens/Auth/LoginWithPhone/create_password.dart';
import 'package:olx_app/Screens/Auth/LoginWithPhone/location_screen.dart';
import 'package:olx_app/Widgets/slide_page_route.dart';

class AlmostThere extends StatelessWidget {
  const AlmostThere({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Text("Skip", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "Almost there...",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text(
                  "Your name is set to: ",
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  "User 81bajc",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              "Add your real name to build credibility and connect better with other people on OLX",
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 20.h),

            Text(
              "Your name",
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            SizedBox(height: 5.h),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter your name",
                hintStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.sp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: const BorderSide(color: Colors.grey, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: const BorderSide(color: Colors.black, width: 1.5),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              ),
            ),

            SizedBox(height: 30.h),

            SizedBox(
              width: double.infinity.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                ),
                onPressed: () {
                  Navigator.of(context).push(SlidePageRoute(page: const LocationScreen()));
                },
                child: Text(
                  'Finish',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
