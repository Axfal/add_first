import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Providers/chat_select_button.dart';
import 'package:olx_app/Widgets/chat_item.dart';
import 'package:provider/provider.dart';

class SellingChats extends StatelessWidget {
  const SellingChats({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatSelectButton(),
      child: Column(
        children: [
          // Buttons Section
          Consumer<ChatSelectButton>(
            builder: (context, provider, _) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildRoundedButton(context, 0, "All", provider),
                    SizedBox(width: 8.w),
                    _buildRoundedButton(context, 1, "Unread", provider),
                    SizedBox(width: 8.w),
                    _buildRoundedButton(context, 2, "Important", provider),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                ChatItem(
                  userName: "Sender",
                  lastMessage: "Last message from user",
                  time: "10:34 AM",
                  profileImageUrl: "assets/images/profile.jpg",
                  product: 'Product name here',
                  statusImageUrl: "assets/images/profile.jpg",
                ),
                SizedBox(height: 10.h),
                ChatItem(
                  userName: "Sender",
                  lastMessage: "Last message from user",
                  time: "10:30 AM",
                  product: 'Product name here',
                  profileImageUrl: "assets/images/profile.jpg",
                  statusImageUrl: "assets/images/profile.jpg",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoundedButton(BuildContext context, int index, String label, ChatSelectButton provider) {
    final isSelected = provider.selectedButton == index;

    return GestureDetector(
      onTap: () {
        provider.setSelectedButton(index);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          color: isSelected ? Colors.blue.shade50 : Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}