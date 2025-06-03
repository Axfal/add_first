import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Screens/Accounts/FavouriteSearches/provider/page_index.dart';
import 'package:olx_app/Screens/Accounts/OrdersAndBillingInfo/MyOrders/Active/active_content.dart';
import 'package:olx_app/Screens/Accounts/OrdersAndBillingInfo/MyOrders/Expired/expired_content.dart';
import 'package:olx_app/Screens/Accounts/OrdersAndBillingInfo/MyOrders/Scheduled/scheduled_content.dart';
import 'package:provider/provider.dart';

class MyOrderMain extends StatelessWidget {
  const MyOrderMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Favourites & Saved Searches', style: TextStyle(fontSize: 18, color: Colors.black),),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Consumer<PageIndexProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => provider.setPageIndex(0),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            alignment: Alignment.center,
                            child: Text(
                              'Active',
                              style: TextStyle(
                                color: provider.pageIndex == 0 ? Colors.black : Colors.black87,
                                fontWeight: provider.pageIndex == 0 ? FontWeight.bold : FontWeight.normal, fontSize: 13.sp
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => provider.setPageIndex(1),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            alignment: Alignment.center,
                            child: Text(
                              'Scheduled',
                              style: TextStyle(
                                color: provider.pageIndex == 1 ? Colors.black : Colors.black87,
                                fontWeight: provider.pageIndex == 1 ? FontWeight.bold : FontWeight.normal, fontSize: 13.sp
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => provider.setPageIndex(1),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            alignment: Alignment.center,
                            child: Text(
                              'Expired',
                              style: TextStyle(
                                color: provider.pageIndex == 2 ? Colors.black : Colors.black87,
                                fontWeight: provider.pageIndex == 2 ? FontWeight.bold : FontWeight.normal, fontSize: 13.sp
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 2.h,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 2.h,
                            color: provider.pageIndex == 0 ? Colors.black : Colors.transparent,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 2.h,
                            color: provider.pageIndex == 1 ? Colors.black : Colors.transparent,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 2.h,
                            color: provider.pageIndex == 2 ? Colors.black : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          const Divider(height: 1, thickness: 1),
          // PageView
          Expanded(
            child: Consumer<PageIndexProvider>(
              builder: (context, provider, child) {
                return PageView(
                  controller: provider.pageController,
                  onPageChanged: (index) {
                    provider.setPageIndex(index);
                  },
                  children: const [
                    ActiveContent(),
                    ScheduledContent(),
                    ExpiredContent(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
