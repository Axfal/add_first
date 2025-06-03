import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Screens/Accounts/OrdersAndBillingInfo/BillingInfo/billing_info_main.dart';
import 'package:olx_app/Screens/Accounts/OrdersAndBillingInfo/MyOrders/my_order_main.dart';
import 'package:olx_app/Screens/Accounts/OrdersAndBillingInfo/Payment/payment_main.dart';
import 'package:olx_app/Widgets/account_items.dart';
import 'package:olx_app/Widgets/slide_page_route.dart';

class OrderBillingMain extends StatelessWidget {
  const OrderBillingMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Bought Packages & Billing', style: TextStyle(fontSize: 18, color: Colors.black),),
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
                    firstText: 'My Orders',
                    secondText: 'Active, scheduled and expired orders',
                    rightIcon: Icons.arrow_forward_ios,
                    onTap: () {
                      Navigator.of(context).push(SlidePageRoute(page: const MyOrderMain()));
                    },
                  ),
                  const Divider(),
                  AccountItems(
                    leftIcon: Icons.remove_red_eye_outlined,
                    isLeftIconVisible: false,
                    firstText: 'Billing Information',
                    secondText: 'Edit your billing name, address, etc.',
                    rightIcon: Icons.arrow_forward_ios,
                    onTap: () {
                      Navigator.of(context).push(SlidePageRoute(page: const BillingInfoMain()));
                    },
                  ),
                  const Divider(),
                  AccountItems(
                    leftIcon: Icons.credit_card,
                    isLeftIconVisible: false,
                    firstText: 'Payments',
                    secondText: 'Payment history',
                    rightIcon: Icons.arrow_forward_ios,
                    onTap: () {
                      Navigator.of(context).push(SlidePageRoute(page: const PaymentMain()));
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