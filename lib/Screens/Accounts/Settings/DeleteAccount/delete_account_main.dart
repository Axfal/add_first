import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteAccountMain extends StatelessWidget {
  const DeleteAccountMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Delete Account', style: TextStyle(fontSize: 18, color: Colors.black),),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Text('After deleting you account', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
            SizedBox(height: 10.h),
            Text('All your ads will be set to inactive and will not be showing to the users.', style: TextStyle(fontSize: 13.sp),),
            SizedBox(height: 6.h),
            Text('You can reactivate your account at any time within 90 days.', style: TextStyle(fontSize: 13.sp),),
            SizedBox(height: 6.h),
            Text('After 90 days the account will be permanently deleted along with the associated personal data.', style: TextStyle(fontSize: 13.sp),),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                ),
                onPressed: () {},
                child: Text(
                  'Change Password',
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