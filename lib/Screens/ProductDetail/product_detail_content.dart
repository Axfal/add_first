import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Widgets/product_details_feature_item.dart';
import 'package:olx_app/Widgets/product_item.dart';

class ProductDetailContent extends StatelessWidget {
  const ProductDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Text(
            "Price",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            "Product Name",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, size: 14.h),
                  SizedBox(width: 4.w),
                  Text(
                    "Area",
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              Text(
                "Date",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          const Divider(),
          SizedBox(height: 8.h),
          Center(
            child: Image.asset(
              'assets/images/home_banner.jpg',
              width: MediaQuery.of(context).size.width*0.7.w,
              height: MediaQuery.of(context).size.height*0.1.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.calendar_month, size: 20.h, color: Colors.blue),
                    SizedBox(width: 4.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Year",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          "2010",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w), // Adjust spacing as required
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.oil_barrel, size: 20.h, color: Colors.blue),
                    SizedBox(width: 4.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fuel",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          "Petrol",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.add_road, size: 20.h, color: Colors.blue),
                    SizedBox(width: 4.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "KM/'s Driven",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          "241,200",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w), // Adjust spacing as required
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.bike_scooter_sharp,
                        size: 20.h, color: Colors.blue),
                    SizedBox(width: 4.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Condition",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          "Used",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.graphic_eq, size: 20.h, color: Colors.blue),
              SizedBox(width: 4.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Transmission",
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    "Automated",
                    style: TextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Text('Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),),
          SizedBox(height: 8.h),
          const CustomRowContainer(
            firstText: "Make",
            secondText: "Suzuki",
            isIconVisible: false,
            icon: Icons.star,
          ),
          const CustomRowContainer(
            firstText: "Color",
            secondText: "White",
            isIconVisible: false,
            icon: Icons.star,
            backgroundColor: Colors.white,
          ),
          const CustomRowContainer(
            firstText: "Model",
            secondText: "Every",
            isIconVisible: false,
            icon: Icons.star,
          ),
          const CustomRowContainer(
            firstText: "Number of Owners",
            secondText: "2",
            isIconVisible: false,
            icon: Icons.star,
            backgroundColor: Colors.white,
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text('See all', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp, color: Colors.blue),),
              SizedBox(width: 6.w),
              Icon(Icons.arrow_forward_ios, size: 11.h, color: Colors.blue,)
            ],
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Text('Features', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),),
          SizedBox(height: 8.h),
          const CustomRowContainer(
            firstText: "Heated Seats",
            secondText: "",
            isIconVisible: true,
            icon: Icons.event_seat,
          ),
          const CustomRowContainer(
            firstText: "Power Steering",
            secondText: "",
            isIconVisible: true,
            icon: Icons.circle_outlined,
            backgroundColor: Colors.white,
          ),
          const CustomRowContainer(
            firstText: "Power Seats",
            secondText: "",
            isIconVisible: true,
            icon: Icons.event_seat_sharp,
          ),
          const CustomRowContainer(
            firstText: "Touch Screen",
            secondText: "",
            isIconVisible: true,
            icon: Icons.screen_lock_landscape,
            backgroundColor: Colors.white,
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text('See all', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp, color: Colors.blue),),
              SizedBox(width: 6.w),
              Icon(Icons.arrow_forward_ios, size: 11.h, color: Colors.blue,)
            ],
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Text('Description', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),),
          SizedBox(height: 8.h),
          Text('For Sale', style: TextStyle(fontSize: 16.sp),),
          Text('Suzuki Every 200 Automatic', style: TextStyle(fontSize: 16.sp),),
          SizedBox(height: 30.h),
          Text('Price: Rs.1564,000', style: TextStyle(fontSize: 16.sp),),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text('Read more', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp, color: Colors.blue),),
              SizedBox(width: 6.w),
              Icon(Icons.arrow_forward_ios, size: 11.h, color: Colors.blue,)
            ],
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Text('Listed by private user', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),),
          SizedBox(height: 12.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.shade50,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/user_default.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    'Abdul Rehman',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Member since Dec 2017',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text('See profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),),
                      SizedBox(width: 6.w),
                      Icon(Icons.arrow_forward_ios, size: 11.h)
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text('Read more', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp, color: Colors.blue),),
              SizedBox(width: 6.w),
              Icon(Icons.arrow_forward_ios, size: 11.h, color: Colors.blue,)
            ],
          ),

          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),

          Center(
            child: Image.asset(
              'assets/images/home_banner.jpg',
              width: MediaQuery.of(context).size.width*0.7.w,
              height: MediaQuery.of(context).size.height*0.1.h,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Text('Location', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, size: 11.h),
                  SizedBox(width: 6.w),
                  Text('Canntt, Sialkot', style: TextStyle(fontSize: 12.sp),),
                ],
              ),
              Text('Ad ID: 1293821998', style: TextStyle(fontSize: 10.sp),),
            ],
          ),
          SizedBox(height: 6.h),
          Center(
            child: Image.asset(
              'assets/images/map.jpg',
              width: MediaQuery.of(context).size.width*0.9.w,
              height: MediaQuery.of(context).size.height*0.13.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(Icons.flag, size: 14.h),
                  SizedBox(width: 6.w),
                  Text('Report this ad', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.remove_red_eye_outlined, size: 14.h),
                  SizedBox(width: 6.w),
                  Text('Hide this ad', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Text('Similar Cars', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),),
          SizedBox(height: 12.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ProductItem(
                  imageUrl: "",
                  price: 3000,
                  productName: "Luxury House",
                  bedsCount: null,
                  bathsCount: null,
                  marlasCount: null,
                  marlaKanal: "marla",
                  model: 2023,
                  meter: 1500,
                  city: "Lahore",
                  daysCount: 3,
                  onTap: () {
                    print("Product tapped!");
                  },
                ),
                SizedBox(width: 12.w),
                ProductItem(
                  imageUrl: "",
                  price: 3000,
                  productName: "Luxury House",
                  bedsCount: null,
                  bathsCount: null,
                  marlasCount: null,
                  marlaKanal: "marla",
                  model: 2023,
                  meter: 1500,
                  city: "Lahore",
                  daysCount: 3,
                  onTap: () {
                    print("Product tapped!");
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Text('New Cars for similar price', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),),
          SizedBox(height: 12.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ProductItem(
                  imageUrl: "",
                  price: 3000,
                  productName: "Luxury House",
                  bedsCount: null,
                  bathsCount: null,
                  marlasCount: null,
                  marlaKanal: "marla",
                  model: 2023,
                  meter: 1500,
                  city: "Lahore",
                  daysCount: 3,
                  onTap: () {
                    print("Product tapped!");
                  },
                ),
                SizedBox(width: 12.w),
                ProductItem(
                  imageUrl: "",
                  price: 3000,
                  productName: "Luxury House",
                  bedsCount: null,
                  bathsCount: null,
                  marlasCount: null,
                  marlaKanal: "marla",
                  model: 2023,
                  meter: 1500,
                  city: "Lahore",
                  daysCount: 3,
                  onTap: () {
                    print("Product tapped!");
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Center(
            child: Image.asset(
              'assets/images/home_banner.jpg',
              width: MediaQuery.of(context).size.width*0.7.w,
              height: MediaQuery.of(context).size.height*0.1.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Text('Your safety matters to us!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),),
          SizedBox(height: 10.h),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Icon(
                        Icons.brightness_1,
                        size: 8.w,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Icon(
                        Icons.brightness_1,
                        size: 8.w,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque euismod, urna eu tincidunt congue.",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Icon(
                        Icons.brightness_1,
                        size: 8.w,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Icon(
                        Icons.brightness_1,
                        size: 8.w,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque euismod, urna eu.",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ],
      ),
    );
  }
}