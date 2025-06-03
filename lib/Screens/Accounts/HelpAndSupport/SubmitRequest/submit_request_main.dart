import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitRequestMain extends StatelessWidget {
  const SubmitRequestMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Submit Request', style: TextStyle(fontSize: 18, color: Colors.black),),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Image.asset(
                      'assets/images/olx_logo.png',
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Text(
                        "OLX PK",
                        style: TextStyle(color: Colors.blue, fontSize: 12.sp,),
                      ),
                      SizedBox(width: 4.h),
                      Icon(Icons.arrow_forward_ios, size: 10.sp, color: Colors.black,),
                      SizedBox(width: 4.h),
                      Text(
                        "Submit a request",
                        style: TextStyle(color: Colors.black, fontSize: 12.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    width: MediaQuery.of(context).size.width*0.83.w,
                    height: 35.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.black, size: 20.sp),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 13.sp ,color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Text(
                    "Submit a request",
                    style: TextStyle(color: Colors.black, fontSize: 24.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Your email address",
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                  ),
                  SizedBox(height: 5.h),
                  _buildTextField(''),
                  SizedBox(height: 10.h),
                  Text(
                    "Subject",
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                  ),
                  SizedBox(height: 5.h),
                  _buildTextField(''),
                  SizedBox(height: 10.h),
                  Text(
                    "Describe your issue",
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                  ),
                  SizedBox(height: 5.h),
                  _buildTextField(''),
                  SizedBox(height: 10.h),
                  Text(
                    "Attachments (optional)",
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(color: Colors.black54)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add file ",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          "or drop files here",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
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
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Submit',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton("Help", () => print("Tapped Home")),
                  _verticalDivider(),
                  _buildButton("Terms of Use", () => print("Tapped Contact Us")),
                  _verticalDivider(),
                  _buildButton("Safety Tips", () => print("Tapped Support")),
                  _verticalDivider(),
                  _buildButton("Contact Us", () => print("Tapped FAQ")),
                  _verticalDivider(),
                  _buildButton("Sell", () => print("Tapped Feedback")),
                ],
              ),
            ),
            Container(
              color: Colors.blue[400],
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
              child: Center(
                child: Text(
                  "OLX Free classifieds in Pakistan - Copyright 2006-2025 OLX",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildButton(String text, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      constraints: BoxConstraints(maxWidth: 60.w),
      child: Column(
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _verticalDivider() {
  return Container(
    height: 30.h,
    width: 1.w,
    color: Colors.grey,
  );
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