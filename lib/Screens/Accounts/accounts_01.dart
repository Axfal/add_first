// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:olx_app/Utils/toast_messages.dart';
import 'package:olx_app/resources/exports.dart';

class Accounts01 extends StatelessWidget {
  const Accounts01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 25.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red.shade50,
                        image: const DecorationImage(
                          image: AssetImage('assets/images/user_default.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Name
                        Text(
                          'Abdul Rahman',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        GestureDetector(
                          onTap: () {
                            print('Underlined text clicked!');
                          },
                          child: Text(
                            'View and edit profile',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColor.primaryColor,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Column(
                  children: [
                    AccountItems(
                      leftIcon: Icons.favorite_outline,
                      firstText: 'Favourites & Saved searches',
                      secondText:
                          'All of your favourite ads and search filters',
                      rightIcon: Icons.arrow_forward_ios,
                      onTap: () {
                        Navigator.of(context).push(SlidePageRoute(
                            page: const FavouriteSearchesMain()));
                      },
                    ),
                    Divider(),
                    AccountItems(
                      leftIcon: Icons.remove_red_eye_outlined,
                      firstText: 'Public Profile',
                      secondText: 'See how others view your profile',
                      rightIcon: Icons.arrow_forward_ios,
                      onTap: () {
                        Navigator.of(context).push(
                            SlidePageRoute(page: const PublicProfileMain()));
                      },
                    ),
                    Divider(),
                    AccountItems(
                      leftIcon: Icons.credit_card,
                      firstText: 'Buy Discounted Packages',
                      secondText:
                          'Sell faster, more & higher margins with packages',
                      rightIcon: Icons.arrow_forward_ios,
                      onTap: () {
                        print('Clicked on Public Profile');
                      },
                    ),
                    Divider(),
                    AccountItems(
                      leftIcon: Icons.book,
                      firstText: 'Orders and Billing Info',
                      secondText: 'Orders, billing and invoices',
                      rightIcon: Icons.arrow_forward_ios,
                      onTap: () {
                        Navigator.of(context).push(
                            SlidePageRoute(page: const OrderBillingMain()));
                      },
                    ),
                    Divider(),
                    AccountItems(
                      leftIcon: Icons.local_shipping_outlined,
                      firstText: 'Delivery Orders',
                      secondText:
                          'Track your selling or buying delivery orders',
                      rightIcon: Icons.arrow_forward_ios,
                      onTap: () {
                        print('Clicked on Public Profile');
                      },
                    ),
                    Divider(),
                    AccountItems(
                      leftIcon: Icons.settings,
                      firstText: 'Settings',
                      secondText: 'Privacy and manage account',
                      rightIcon: Icons.arrow_forward_ios,
                      onTap: () {
                        Navigator.of(context)
                            .push(SlidePageRoute(page: const SettingsMain()));
                      },
                    ),
                    Container(
                      height: 15.h,
                      color: Colors.grey.shade300,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: AccountItems(
                        leftIcon: Icons.help_outline,
                        firstText: 'Help & Support',
                        secondText: 'Help center and legal terms',
                        rightIcon: Icons.arrow_forward_ios,
                        onTap: () {
                          Navigator.of(context).push(
                              SlidePageRoute(page: const HelpSupportMain()));
                        },
                      ),
                    ),
                    Container(
                      height: 15.h,
                      color: Colors.grey.shade300,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: AccountItems(
                        leftIcon: Icons.logout,
                        firstText: 'Logout',
                        secondText: '',
                        rightIcon: Icons.arrow_forward_ios,
                        isRightIconVisible: false,
                        onTap: () async {
                          final localDatabase = MySharedPrefs();
                          await localDatabase.clearUserSession();
                          ToastHelper.showSuccess("Logged out successfully");
                          Navigator.pushReplacementNamed(
                              context, RoutesName.loginScreen);
                        },
                      ),
                    ),
                    Container(
                      height: 15.h,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
