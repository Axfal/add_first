import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Screens/Accounts/HelpAndSupport/HelpCentre/help_center_main.dart';
import 'package:olx_app/Screens/Accounts/HelpAndSupport/SubmitRequest/submit_request_main.dart';
import 'package:olx_app/Widgets/account_items.dart';
import 'package:olx_app/Widgets/slide_page_route.dart';

class HelpSupportMain extends StatelessWidget {
  const HelpSupportMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Help and Support',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
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
                    leftIcon: Icons.remove_red_eye_outlined,
                    isLeftIconVisible: false,
                    firstText: 'Help Center',
                    secondText: 'See FAQ and contact support',
                    rightIcon: Icons.arrow_forward_ios,
                    onTap: () {
                      Navigator.of(context)
                          .push(SlidePageRoute(page: const HelpCenterMain()));
                    },
                  ),
                  const Divider(),
                  AccountItems(
                    leftIcon: Icons.credit_card,
                    isLeftIconVisible: false,
                    firstText: 'Feedback',
                    secondText:
                        'Take a moment to let us know how we\'re doing ',
                    rightIcon: Icons.arrow_forward_ios,
                    onTap: () {
                      _showFeedbackBottomSheet(context);
                    },
                  ),
                  const Divider(),
                  AccountItems(
                    leftIcon: Icons.credit_card,
                    isLeftIconVisible: false,
                    firstText: 'Invite friends to OLX',
                    secondText: 'Invite your friends to buy and sell',
                    rightIcon: Icons.arrow_forward_ios,
                    onTap: () {},
                  ),
                  const Divider(),
                  AccountItems(
                    leftIcon: Icons.credit_card,
                    isLeftIconVisible: false,
                    firstText: 'Submit Request',
                    secondText: 'Submit an email to the customer service',
                    rightIcon: Icons.arrow_forward_ios,
                    onTap: () {
                      Navigator.of(context).push(
                          SlidePageRoute(page: const SubmitRequestMain()));
                    },
                  ),
                  const Divider(),
                  AccountItems(
                    leftIcon: Icons.favorite_outline,
                    isLeftIconVisible: false,
                    isRightIconVisible: false,
                    firstText: 'Version',
                    secondText: '1.0',
                    rightIcon: Icons.arrow_forward_ios,
                    onTap: () {},
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

void _showFeedbackBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    builder: (BuildContext context) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 0.3.sh,
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "How satisfied are you\nwith the OLX app today?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _emojiFeedback("😡", "Hate"),
                    _emojiFeedback("😟", "Dislike"),
                    _emojiFeedback("😐", "Neutral"),
                    _emojiFeedback("🙂", "Like"),
                    _emojiFeedback("😍", "Love"),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 20.w,
            top: -20.h,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

Widget _emojiFeedback(String emoji, String label) {
  return Column(
    children: [
      Text(emoji, style: TextStyle(fontSize: 24.sp)),
      SizedBox(height: 4.h),
      Text(
        label,
        style: TextStyle(fontSize: 12.sp),
      ),
    ],
  );
}
