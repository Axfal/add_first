import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillingInfoMain extends StatelessWidget {
  const BillingInfoMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Billing Information', style: TextStyle(fontSize: 18, color: Colors.black),),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Customer Type",
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                  ),
                  TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red, fontSize: 14.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            _buildTextField('Select Type'),
            SizedBox(height: 10.h),
            Text(
              "Email",
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            SizedBox(height: 5.h),
            _buildTextField('Enter your email'),
            SizedBox(height: 10.h),
            Text(
              "Customer Name",
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            SizedBox(height: 5.h),
            _buildTextField('Enter your name'),
            SizedBox(height: 10.h),
            Text(
              "Business Name",
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            SizedBox(height: 5.h),
            _buildTextField('Enter your business name'),
            SizedBox(height: 10.h),
            Text(
              "Phone",
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            SizedBox(height: 5.h),
            _buildTextField('Enter your phone number'),
            SizedBox(height: 10.h),
            const Divider(),
            SizedBox(height: 5.h),
            Text(
              "Customer Address",
              style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              "Address Line",
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            SizedBox(height: 6.h),
            _buildTextField('Enter your address'),
            SizedBox(height: 10.h),
            Text(
              "City",
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            SizedBox(height: 5.h),
            _buildTextField('Enter your city'),
            SizedBox(height: 26.h),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                ),
                onPressed: () {},
                child: Text(
                  'Save',
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

Widget _buildTextField( String label) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10.h),
    child: TextField(
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(color: Colors.black, fontSize: 13.sp),
        ),
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
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
      ),
    ),
  );
}