import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Widgets/notification_screen_item.dart';

class NotificationMain extends StatelessWidget {
  const NotificationMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Notifications', style: TextStyle(fontSize: 18, color: Colors.black),),
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
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Column(
                children: [
                  NotificationScreenItem(
                    firstText: 'Active Notifications',
                    secondText: 'Active Notifications',
                    isSwitchVisible: false,
                    switchValue: false,
                    onSwitchChanged: (bool value) {
                      print('Switch toggled: $value');
                    },
                    onTap: () {
                      print('Notification item tapped');
                    },
                  ),
                  NotificationScreenItem(
                    firstText: 'Recommendations',
                    secondText: 'Receive recommendations based on your activity',
                    isSwitchVisible: true,
                    switchValue: true,
                    onSwitchChanged: (bool value) {
                      print('Switch toggled: $value');
                    },
                    onTap: () {
                      print('Notification item tapped');
                    },
                  ),
                  const Divider(),
                  NotificationScreenItem(
                    firstText: 'Special communication & offers',
                    secondText: 'Receive updates, offers, surveys and more',
                    isSwitchVisible: true,
                    switchValue: false,
                    onSwitchChanged: (bool value) {
                      print('Switch toggled: $value');
                    },
                    onTap: () {
                      print('Notification item tapped');
                    },
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}