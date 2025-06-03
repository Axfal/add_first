import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Providers/chats.dart';
import 'package:olx_app/Screens/Chats/chat_screen/all_chats.dart';
import 'package:olx_app/Screens/Chats/buying_chats.dart';
import 'package:olx_app/Screens/Chats/selling_chats.dart';
import 'package:provider/provider.dart';

class Chats01 extends StatelessWidget {
  const Chats01({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatTabProvider(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Chats',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: Column(
          children: [
            // Tab bar
            Container(
              height: 50.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTabItem(context, 0, "All"),
                  _buildTabItem(context, 1, "Buying"),
                  _buildTabItem(context, 2, "Selling"),
                ],
              ),
            ),
            // PageView
            Expanded(
              child: Consumer<ChatTabProvider>(
                builder: (context, provider, _) {
                  return PageView(
                    onPageChanged: (index) {
                      provider.setSelectedIndex(index);
                    },
                    controller: PageController(
                      initialPage: provider.selectedIndex,
                      keepPage: true,
                    ),
                    physics: const ClampingScrollPhysics(),
                    children: const [
                      AllChats(),
                      BuyingChats(),
                      SellingChats(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(BuildContext context, int index, String label) {
    return GestureDetector(
      onTap: () {
        Provider.of<ChatTabProvider>(context, listen: false)
            .setSelectedIndex(index);
      },
      child: Consumer<ChatTabProvider>(
        builder: (context, provider, _) {
          final isSelected = provider.selectedIndex == index;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.black : Colors.grey,
                ),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                height: 2.h,
                width: 100.w,
                child: isSelected
                    ? Container(
                  color: Colors.black,
                  width: 50.w,
                )
                    : const SizedBox(),
              ),
            ],
          );
        },
      ),
    );
  }
}