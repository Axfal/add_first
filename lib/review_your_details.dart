import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewYourDetails extends StatelessWidget {
  const ReviewYourDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Review your details',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 14.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 70.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green.shade50,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/user_default.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your name",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Abdul Rehman",
                            hintStyle: TextStyle(color: Colors.black, fontSize: 15.sp),
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
                            contentPadding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Verified Phone Number",
                      style: TextStyle(color: Colors.black, fontSize: 18.sp),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 22.sp),
                      SizedBox(width: 4.w),
                      Text(
                        "+92 123 4567890",
                        style: TextStyle(color: Colors.green, fontSize: 16.sp),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Show my phone number in ads",
                      style: TextStyle(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: (bool value) {
                    },
                    activeColor: Colors.black,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
