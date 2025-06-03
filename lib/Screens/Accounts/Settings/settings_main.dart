import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Screens/Accounts/Settings/Address/address_main.dart';
import 'package:olx_app/Screens/Accounts/Settings/DeleteAccount/delete_account_main.dart';
import 'package:olx_app/Screens/Accounts/Settings/Notifications/notification_main.dart';
import 'package:olx_app/Screens/Accounts/Settings/Privacy/privacy_main.dart';
import 'package:olx_app/Screens/Accounts/Settings/UserPreferences/user_preferences_main.dart';
import 'package:olx_app/Widgets/account_items.dart';
import 'package:olx_app/Widgets/slide_page_route.dart';

class SettingsMain extends StatelessWidget {
  const SettingsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontSize: 18, color: Colors.black),),
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
                  AccountItems(
                    leftIcon: Icons.favorite_outline,
                    isLeftIconVisible: false,
                    firstText: 'Privacy',
                    secondText: 'Phone number visibility',
                    rightIcon: Icons.arrow_forward_ios,
                    onTap: () {
                      Navigator.of(context).push(SlidePageRoute(page: const PrivacyMain()));
                    },
                  ),
                  const Divider(),
                  AccountItems(
                    leftIcon: Icons.remove_red_eye_outlined,
                    isLeftIconVisible: false,
                    firstText: 'Notifications',
                    secondText: 'Recommendations and special communication',
                    rightIcon: Icons.arrow_forward_ios,
                    onTap: () {
                      Navigator.of(context).push(SlidePageRoute(page: const NotificationMain()));
                    },
                  ),
                  const Divider(),
                  AccountItems(
                    leftIcon: Icons.credit_card,
                    isLeftIconVisible: false,
                    firstText: 'Delete account',
                    secondText: 'Take action on account',
                    rightIcon: Icons.arrow_forward_ios,
                    onTap: () {
                      Navigator.of(context).push(SlidePageRoute(page: const DeleteAccountMain()));
                    },
                  ),
                  const Divider(),
                  AccountItems(
                    leftIcon: Icons.credit_card,
                    isLeftIconVisible: false,
                    firstText: 'Address Information',
                    secondText: 'Edit your Address information',
                    rightIcon: Icons.arrow_forward_ios,
                    onTap: () {
                      Navigator.of(context).push(SlidePageRoute(page: const AddressMain()));
                    },
                  ),
                  const Divider(),
                  AccountItems(
                    leftIcon: Icons.credit_card,
                    isLeftIconVisible: false,
                    firstText: 'User Preferences',
                    secondText: 'Customize appearance',
                    rightIcon: Icons.arrow_forward_ios,
                    onTap: () {
                      Navigator.of(context).push(SlidePageRoute(page: const UserPreferencesMain()));
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