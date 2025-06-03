import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Providers/privacy_chat_selection.dart';
import 'package:olx_app/Screens/Accounts/Settings/Privacy/ChangePassword/change_password_main.dart';
import 'package:olx_app/Screens/Accounts/Settings/settings_main.dart';
import 'package:olx_app/Widgets/account_items.dart';
import 'package:olx_app/Widgets/slide_page_route.dart';
import 'package:provider/provider.dart';

class PrivacyMain extends StatelessWidget {
  const PrivacyMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PrivacyChatSelection(),
      child: Consumer<PrivacyChatSelection>(
        builder: (context, provider, _) {
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
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.h),
                      Text('Contact Method', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          _buildRoundedButton(context, 0, "Phone", provider),
                          SizedBox(width: 8.w),
                          _buildRoundedButton(context, 1, "Olx Chat", provider),
                          SizedBox(width: 8.w),
                          _buildRoundedButton(context, 2, "Both", provider),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                const Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: AccountItems(
                    isLeftIconVisible: false,
                    leftIcon: Icons.logout,
                    firstText: 'Change Password',
                    secondText: '',
                    rightIcon: Icons.arrow_forward_ios,
                    onTap: () {
                      Navigator.of(context).push(SlidePageRoute(page: const ChangePasswordMain()));
                    },
                  ),
                ),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRoundedButton(BuildContext context, int index, String label, PrivacyChatSelection provider) {
    final isSelected = provider.selectedButton == index;

    return GestureDetector(
      onTap: () {
        provider.setSelectedButton(index);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey,
          ),
          color: isSelected ? Colors.black12 : Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
