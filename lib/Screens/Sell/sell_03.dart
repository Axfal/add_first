import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Screens/MyAds/ad_details.dart';
import 'package:olx_app/Widgets/category/categories_item.dart';

class Sell03 extends StatelessWidget {
  const Sell03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 27,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text('Products', style: TextStyle(fontSize: 18.sp),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                ),
                CategoriesItemCard(
                  imageVisible: false,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const AdDetails()));
                  },
                  text: 'Road Bikes',
                  textSize: 15,
                  iconVisible: false,
                  icon: Icons.arrow_forward_ios,
                ),
                SizedBox(height: 20.h),
                CategoriesItemCard(
                  imageVisible: false,
                  text: 'Hybrid Bikes',
                  textSize: 15,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const AdDetails()));
                  },
                  iconVisible: false,
                  icon: Icons.arrow_forward_ios,
                ),
                SizedBox(height: 20.h),
                CategoriesItemCard(
                  imageVisible: false,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const AdDetails()));

                  },
                  text: 'BMX Bikes',
                  textSize: 15,
                  iconVisible: false,
                  icon: Icons.arrow_forward_ios,
                ),
                SizedBox(height: 20.h),
                CategoriesItemCard(
                  imageVisible: false,
                  text: 'Electric Bikes',
                  textSize: 15,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const AdDetails()));

                  },
                  iconVisible: false,
                  icon: Icons.arrow_forward_ios,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
