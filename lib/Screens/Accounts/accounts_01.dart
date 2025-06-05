// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:olx_app/resources/exports.dart';

class Accounts01 extends StatelessWidget {
  const Accounts01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          children: [
            /// Profile Header
            Row(
              children: [
                Container(
                  width: 72.w,
                  height: 72.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/user_default.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Abdul Rahman',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(4),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: Text(
                            'View and edit profile',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 36.h),

            /// Menu Items
            _buildMenuItem(
              context,
              icon: Icons.favorite_outline,
              title: 'Favourites & Saved searches',
              subtitle: 'Your saved ads and searches',
              onTap: () => Navigator.of(context).push(
                SlidePageRoute(page: const FavouriteSearchesMain()),
              ),
            ),
            _buildMenuItem(
              context,
              icon: Icons.remove_red_eye_outlined,
              title: 'Public Profile',
              subtitle: 'How others see your profile',
              onTap: () => Navigator.of(context).push(
                SlidePageRoute(page: const PublicProfileMain()),
              ),
            ),
            _buildMenuItem(
              context,
              icon: Icons.credit_card,
              title: 'Buy Discounted Packages',
              subtitle: 'Sell faster & more with packages',
              onTap: () {},
            ),
            _buildMenuItem(
              context,
              icon: Icons.book_outlined,
              title: 'Orders and Billing Info',
              subtitle: 'Track your orders & billing',
              onTap: () => Navigator.of(context).push(
                SlidePageRoute(page: const OrderBillingMain()),
              ),
            ),
            _buildMenuItem(
              context,
              icon: Icons.local_shipping_outlined,
              title: 'Delivery Orders',
              subtitle: 'Track your deliveries',
              onTap: () {},
            ),
            _buildMenuItem(
              context,
              icon: Icons.settings_outlined,
              title: 'Settings',
              subtitle: 'Privacy & account settings',
              onTap: () => Navigator.of(context).push(
                SlidePageRoute(page: const SettingsMain()),
              ),
            ),
            _buildMenuItem(
              context,
              icon: Icons.help_outline,
              title: 'Help & Support',
              subtitle: 'FAQs and legal information',
              onTap: () => Navigator.of(context).push(
                SlidePageRoute(page: const HelpSupportMain()),
              ),
            ),

            /// Logout
            _buildMenuItem(
              context,
              icon: Icons.logout,
              title: 'Logout',
              subtitle: '',
              showArrow: false,
              onTap: () async {
                final localDatabase = MySharedPrefs();
                await localDatabase.clearUserSession();
                ToastHelper.showSuccess("Logged out successfully");
                Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool showArrow = true,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      splashColor: Colors.grey.withValues(alpha: 0.1),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 26.sp, color: Colors.black87),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      if (subtitle.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                if (showArrow)
                  Icon(Icons.arrow_forward_ios,
                      size: 16.sp, color: Colors.grey[400]),
              ],
            ),
            SizedBox(height: 14.h),
            Divider(color: Colors.grey[300], height: 1),
          ],
        ),
      ),
    );
  }
}
