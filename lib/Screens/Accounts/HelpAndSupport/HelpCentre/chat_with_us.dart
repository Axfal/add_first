import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatWithUs extends StatelessWidget {
  const ChatWithUs({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color(0xff012e01),
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
              child: Center(
                child: Text(
                  "Chat with us",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  Text(
                    "Name",
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                  ),
                  SizedBox(height: 5.h),
                  _buildTextField(''),
                  SizedBox(height: 10.h),
                  Text(
                    "Email",
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                  ),
                  SizedBox(height: 5.h),
                  _buildTextField(''),
                  SizedBox(height: 10.h),
                  Text(
                    "Phone number",
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                  ),
                  SizedBox(height: 5.h),
                  _buildTextField(''),
                  SizedBox(height: 10.h),
                  Text(
                    "Message",
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                  ),
                  SizedBox(height: 5.h),
                  _buildTextField(''),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "zenDesk",
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
            SizedBox(
              width: 0.40.sw,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff012e01),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                ),
                onPressed: () {},
                child: Text(
                  'Message',
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