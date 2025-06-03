import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:olx_app/Providers/dashboard_provider.dart';
import 'package:olx_app/Screens/Accounts/accounts_01.dart';
import 'package:olx_app/Screens/Chats/chats_01.dart';
import 'package:olx_app/Screens/Home/home_01.dart';
import 'package:olx_app/Screens/MyAds/my_ads_main.dart';
import 'package:olx_app/Screens/Sell/sell_01.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardProvider(),
      child: Consumer<DashboardProvider>(
        builder: (context, dashboardProvider, _) {
          final selectedIndex = dashboardProvider.selectedIndex;

          final List<Widget> pages = [
            const Home01(),
            const Chats01(),
            const Sell01(),
            const MyAds01(),
            const Accounts01(),
          ];

          return WillPopScope(
            onWillPop: () async {
              if (selectedIndex != 0) {
                dashboardProvider.updateSelectedIndex(0);
                return false;
              }
              return true;
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body: IndexedStack(
                index: selectedIndex,
                children: pages,
              ),
              bottomNavigationBar: selectedIndex == 2
                  ? null
                  : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0.r),
                    topRight: Radius.circular(15.0.r),
                  ),
                ),
                child: BottomNavigationBar(
                  currentIndex: selectedIndex,
                  onTap: (index) {
                    dashboardProvider.updateSelectedIndex(index);
                    if (index == 2) {
                      _navigateToSellPage(context);
                    }
                  },

                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.black,
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  iconSize: 20.sp,
                  selectedLabelStyle: TextStyle(fontSize: 12.sp, color: Colors.black),
                  unselectedLabelStyle: TextStyle(fontSize: 12.sp, color: Colors.black),
                  items: [
                    _buildBottomNavigationBarItem(
                      'assets/svg_bottom/home_outline.svg',
                      'assets/svg_bottom/home_fill.svg',
                      'Home',
                      0,
                      selectedIndex,
                    ),
                    _buildBottomNavigationBarItem(
                      'assets/svg_bottom/message_outline.svg',
                      'assets/svg_bottom/message_fill.svg',
                      'Chats',
                      1,
                      selectedIndex,
                    ),
                    _buildBottomNavigationBarItem(
                      'assets/svg_bottom/sell_02.svg',
                      'assets/svg_bottom/sell_02.svg',
                      'Sell',
                      2,
                      selectedIndex,
                    ),
                    _buildBottomNavigationBarItem(
                      'assets/svg_bottom/My_Ads_outline.svg',
                      'assets/svg_bottom/My_Ads_fill.svg',
                      'My Ads',
                      3,
                      selectedIndex,
                    ),
                    _buildBottomNavigationBarItem(
                      'assets/svg_bottom/profile_outline.svg',
                      'assets/svg_bottom/profile_fill.svg',
                      'Account',
                      4,
                      selectedIndex,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToSellPage(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const Sell01(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    ).then((_) {
      Provider.of<DashboardProvider>(context, listen: false).updateSelectedIndex(0);
    });
  }


  BottomNavigationBarItem _buildBottomNavigationBarItem(
      String unselectedSvg, String selectedSvg, String label, int index, int selectedIndex) {
    bool isSelected = index == selectedIndex;

    return BottomNavigationBarItem(
      icon: Column(
        children: [
          buildSvgIcon(
            isSelected ? selectedSvg : unselectedSvg,
            isSelected: isSelected,
          ),
          // if (isSelected)
          //   Container(
          //     margin: EdgeInsets.only(top: 2.0.h),
          //     width: 20.w,
          //     height: 2.h,
          //     color: Colors.black,
          //   ),
        ],
      ),
      label: label,
    );
  }
}

Widget buildSvgIcon(String assetPath, {required bool isSelected}) {
  return SvgPicture.asset(
    assetPath,
    width: 24,
    height: 24,
  );
}
