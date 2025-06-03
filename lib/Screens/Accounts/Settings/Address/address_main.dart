import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Screens/Accounts/Settings/Address/add_address.dart';
import 'package:olx_app/Screens/Accounts/Settings/Privacy/privacy_main.dart';
import 'package:olx_app/Widgets/slide_page_route.dart';

class AddressMain extends StatelessWidget {
  const AddressMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Address List', style: TextStyle(fontSize: 18, color: Colors.black),),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.black, size: 25.sp,),
            onPressed: () {
              Navigator.of(context).push(SlidePageRoute(page: const AddAddress()));
            },
          ),
        ],
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_off,
              size: 100.w,
              color: Colors.grey[400],
            ),
            SizedBox(height: 20.h),
            Text(
              'You have no address yet',
              style: TextStyle(fontSize: 16.sp, color: Colors.black),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
