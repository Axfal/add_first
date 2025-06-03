import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Widgets/app_notication_item.dart';

class AppNotifications extends StatelessWidget {
  const AppNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close, size: 30,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text('Notifications', style: TextStyle(fontSize: 20.sp),),
              ],
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppNoticationItem(
                    imageUrl: 'assets/images/books.png',
                    title: 'Your ad is live!',
                    subtitle: '1 day ago',
                  ),
                  Divider(),
                  AppNoticationItem(
                    imageUrl: 'assets/images/clothing.png',
                    title: 'Your ad is live!',
                    subtitle: '9 day ago',
                  ),
                  Divider(),
                  AppNoticationItem(
                    imageUrl: 'assets/images/books.png',
                    title: 'Your ad expired!',
                    subtitle: '9 day ago',
                  ),
                  Divider(),
                  AppNoticationItem(
                    imageUrl: 'assets/images/clothing.png',
                    title: 'Your ad expired!',
                    subtitle: '9 day ago',
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
