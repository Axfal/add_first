import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Screens/Auth/LoginWithPhone/enter_otp.dart';
import 'package:olx_app/Widgets/slide_page_route.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new, size: 25.sp),
            ),
            SizedBox(height: 16.h),
            Text(
              "Create a password",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.h),

            Text(
              "Password",
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            SizedBox(height: 5.h),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter password",
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
                suffixIcon: Icon(Icons.remove_red_eye_outlined, size: 23.sp),
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              "Confirm Password",
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            SizedBox(height: 5.h),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter password again",
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
                suffixIcon: Icon(Icons.remove_red_eye_outlined, size: 23.sp),
              ),
            ),
            SizedBox(height: 16.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
                children: [
                  const TextSpan(
                    text: 'When creating a new account, you agree to ',
                  ),
                  TextSpan(
                    text: 'OLX Terms and Conditions',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = (){},
                  ),
                  const TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = (){},
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.h),

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
                  Navigator.of(context).push(SlidePageRoute(page: const EnterOtp()));
                },
                child: Text(
                  'Agree and Create Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
                ),
              ),
            ),

            const Spacer(),

            Center(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Already have an account? Log in",
                  style: TextStyle(fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
