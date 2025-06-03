import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Widgets/favourites_product_item.dart';

class FavouritesScreenContent extends StatelessWidget {
  const FavouritesScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            FavouritesProductItem(
              image: const AssetImage('assets/images/home_banner.jpg'),
              price: 3000,
              productName: "Luxury House",
              bedsCount: 3,
              bathsCount: 2,
              marlasCount: null,
              marlaKanal: "marla",
              model: null,
              meter: null,
              city: "Lahore",
              daysCount: 3,
              onTap: () {
                print("Product tapped!");
              },
            ),
            SizedBox(height: 10.h),
            FavouritesProductItem(
              image: const AssetImage('assets/images/home_appliances.png'),
              price: 3000,
              productName: "Luxury House",
              bedsCount: 3,
              bathsCount: 2,
              marlasCount: null,
              marlaKanal: "marla",
              model: null,
              meter: null,
              city: "Lahore",
              daysCount: 3,
              onTap: () {
                print("Product tapped!");
              },
            ),
            SizedBox(height: 10.h),
            FavouritesProductItem(
              image: const AssetImage('assets/images/home_banner.jpg'),
              price: 3000,
              productName: "Luxury House",
              bedsCount: 3,
              bathsCount: 2,
              marlasCount: null,
              marlaKanal: "marla",
              model: null,
              meter: null,
              city: "Lahore",
              daysCount: 3,
              onTap: () {
                print("Product tapped!");
              },
            ),
            SizedBox(height: 10.h),
            FavouritesProductItem(
              image: const AssetImage('assets/images/home_appliances.png'),
              price: 3000,
              productName: "Luxury House",
              bedsCount: 3,
              bathsCount: 2,
              marlasCount: null,
              marlaKanal: "marla",
              model: null,
              meter: null,
              city: "Lahore",
              daysCount: 3,
              onTap: () {
                print("Product tapped!");
              },
            ),
            SizedBox(height: 10.h),
            FavouritesProductItem(
              image: const AssetImage('assets/images/home_banner.jpg'),
              price: 3000,
              productName: "Luxury House",
              bedsCount: 3,
              bathsCount: 2,
              marlasCount: null,
              marlaKanal: "marla",
              model: null,
              meter: null,
              city: "Lahore",
              daysCount: 3,
              onTap: () {
                print("Product tapped!");
              },
            ),
            SizedBox(height: 10.h),
            FavouritesProductItem(
              image: const AssetImage('assets/images/home_appliances.png'),
              price: 3000,
              productName: "Luxury House",
              bedsCount: 3,
              bathsCount: 2,
              marlasCount: null,
              marlaKanal: "marla",
              model: null,
              meter: null,
              city: "Lahore",
              daysCount: 3,
              onTap: () {
                print("Product tapped!");
              },
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
