import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Screens/Accounts/HelpAndSupport/HelpCentre/chat_with_us.dart';
import 'package:olx_app/Screens/Accounts/HelpAndSupport/HelpCentre/widget/options_card.dart';
import 'package:olx_app/Screens/Accounts/HelpAndSupport/HelpCentre/widget/text_card.dart';
import 'package:olx_app/Screens/Accounts/HelpAndSupport/SubmitRequest/submit_request_main.dart';
import 'package:olx_app/Widgets/slide_page_route.dart';

class HelpCenterMain extends StatelessWidget {
  const HelpCenterMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Help', style: TextStyle(fontSize: 18, color: Colors.black),),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Image.asset(
                'assets/images/olx_logo.png',
                width: 60.w,
                height: 60.h,
                fit: BoxFit.contain,
              ),
            ),

            Stack(
              children: [
                Container(
                  height: 0.33.sh,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/help_centre_bg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.83.w,
                      height: 35.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.black, size: 20.sp),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 13.sp ,color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
              child: Column(
                children: [
                  const OptionsCard(
                    title: "Important Updates",
                    description: "All important details regarding OLX Pakistan App Upgradation",
                  ),
                  SizedBox(height: 6.h),
                  const OptionsCard(
                    title: "Important Updates",
                    description: "All important details regarding OLX Pakistan App Upgradation",
                  ),
                  SizedBox(height: 16.h),
                  const Divider(),
                  SizedBox(height: 6.h),
                  Text('Recent Activity', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
                  SizedBox(height: 6.h),
                  TextCard(
                    boldText: "Important Information",
                    buttonText: "Tap here for details",
                    description:
                    "This description can vary in length",
                    messageCount: 2,
                    onButtonTap: () {
                      print("Button tapped!");
                    },
                  ),
                  SizedBox(height: 6.h),
                  const Divider(),
                  SizedBox(height: 6.h),
                  TextCard(
                    boldText: "Important Information",
                    buttonText: "Tap here for details",
                    description:
                    "This description can vary in length",
                    messageCount: 2,
                    onButtonTap: () {
                      print("Button tapped!");
                    },
                  ),
                  SizedBox(height: 6.h),
                  const Divider(),
                  SizedBox(height: 6.h),
                  TextCard(
                    boldText: "Important Information",
                    buttonText: "Tap here for details",
                    description:
                    "This description can vary in length",
                    messageCount: 2,
                    onButtonTap: () {
                      print("Button tapped!");
                    },
                  ),
                  SizedBox(height: 6.h),
                  const Divider(),
                  SizedBox(height: 6.h),
                  GestureDetector(
                    onTap: (){},
                    child: Text(
                      "See More",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.blue,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton("Help", () => print("Tapped Home")),
                  _verticalDivider(),
                  _buildButton("Terms of Use", () => print("Tapped Contact Us")),
                  _verticalDivider(),
                  _buildButton("Safety Tips", () => print("Tapped Support")),
                  _verticalDivider(),
                  _buildButton("Contact Us", () => print("Tapped FAQ")),
                  _verticalDivider(),
                  _buildButton("Sell", () => print("Tapped Feedback")),
                ],
              ),
            ),
            Container(
              color: Colors.blue[400],
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
              child: Center(
                child: Text(
                  "OLX Free classifieds in Pakistan - Copyright 2006-2025 OLX",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 40.h,
        width: 50.w,
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.of(context).push(SlidePageRoute(page: const ChatWithUs()));
          },
          child: Icon(
            Icons.message,
            size: 20.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

Widget _buildButton(String text, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      constraints: BoxConstraints(maxWidth: 60.w),
      child: Column(
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _verticalDivider() {
  return Container(
    height: 30.h,
    width: 1.w,
    color: Colors.grey,
  );
}
