import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Screens/Dashboard/dashboard_main.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({
    super.key,
    required this.title,
    required this.googleText,
    required this.facebookText,
    required this.emailText,
    required this.phoneText,
    required this.onGoogleTap,
    required this.onFacebookTap,
    required this.onEmailTap,
    required this.onPhoneTap,
    required this.bottomText,
    required this.onBottomTextTap,
    this.agreementTextVisibility = false,
    this.onTermsTap,
    this.onPrivacyPolicyTap,
  });

  final String title;
  final String googleText;
  final String facebookText;
  final String emailText;
  final String phoneText;
  final VoidCallback onGoogleTap;
  final VoidCallback onFacebookTap;
  final VoidCallback onEmailTap;
  final VoidCallback onPhoneTap;
  final String bottomText;
  final VoidCallback onBottomTextTap;
  final bool agreementTextVisibility;
  final VoidCallback? onTermsTap;
  final VoidCallback? onPrivacyPolicyTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardPage()));
              },
              icon: Icon(Icons.close, size: 30.sp),
              alignment: Alignment.centerLeft,
            ),
            SizedBox(height: 6.h),
            Center(
              child: Image.asset(
                'assets/images/olx_logo.png',
                width: 100.w,
                height: 100.h,
              ),
            ),
            SizedBox(height: 4.h),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            _buildOutlinedButton(
              onPressed: onGoogleTap,
              text: googleText,
              icon: Icons.g_mobiledata,
            ),
            SizedBox(height: 12.h),
            _buildOutlinedButton(
              onPressed: onFacebookTap,
              text: facebookText,
              icon: Icons.facebook,
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    'OR',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            _buildOutlinedButton(
              onPressed: onEmailTap,
              text: emailText,
              icon: Icons.email_outlined,
            ),
            SizedBox(height: 12.h),
            _buildOutlinedButton(
              onPressed: onPhoneTap,
              text: phoneText,
              icon: Icons.phone,
            ),
            if (agreementTextVisibility)
              Padding(
                padding: EdgeInsets.only(top: 16.h, left: 18.w, right: 18.w),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(fontSize: 13.sp, color: Colors.black),
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
                        recognizer: TapGestureRecognizer()..onTap = onTermsTap,
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = onPrivacyPolicyTap,
                      ),
                    ],
                  ),
                ),
              ),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: onBottomTextTap,
                child: Text(
                  bottomText,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildOutlinedButton({
    required VoidCallback onPressed,
    required String text,
    required IconData icon,
  }) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          side: const BorderSide(color: Colors.grey, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.r),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                icon,
                size: 24.sp,
                color: Colors.black,
              ),
            ),
            Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
