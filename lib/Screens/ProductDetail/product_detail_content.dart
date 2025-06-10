// ignore_for_file: prefer_const_constructors
import 'package:olx_app/resources/exports.dart';

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
            "Product Name",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            "Price",
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor),
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: _buildBannerImage(context, 'assets/images/home_banner.jpg'),
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoCard(
                icon: Icons.calendar_month,
                label: "Year",
                value: "2010",
                context: context,
              ),
              _buildInfoCard(
                icon: Icons.oil_barrel,
                label: "Fuel",
                value: "Petrol",
                context: context,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoCard(
                icon: Icons.add_road,
                label: "KM/'s Driven",
                value: "241,200",
                context: context,
              ),
              _buildInfoCard(
                icon: Icons.bike_scooter_sharp,
                label: "Condition",
                value: "Used",
                context: context,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          _buildInfoCard(
            icon: Icons.graphic_eq,
            label: "Transmission",
            value: "Automated",
            context: context,
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Text(
            'Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
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
              Text(
                'See all',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: AppColor.primaryColor),
              ),
              SizedBox(width: 6.w),
              Icon(
                Icons.arrow_forward_ios,
                size: 11.h,
                color: AppColor.primaryColor,
              )
            ],
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Text(
            'Features',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
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
              Text(
                'See all',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: AppColor.primaryColor),
              ),
              SizedBox(width: 6.w),
              Icon(
                Icons.arrow_forward_ios,
                size: 11.h,
                color: AppColor.primaryColor,
              )
            ],
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            'For Sale',
            style: TextStyle(fontSize: 16.sp),
          ),
          Text(
            'Suzuki Every 200 Automatic',
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(height: 30.h),
          Text(
            'Price: Rs.1564,000',
            style: TextStyle(
                fontSize: 16.sp,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                'Read more',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  color: AppColor.primaryColor,
                ),
              ),
              SizedBox(width: 6.w),
              Icon(
                Icons.arrow_forward_ios,
                size: 11.h,
                color: AppColor.primaryColor,
              )
            ],
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Text(
            'Listed by private user',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                // Profile Image with soft border and slight shadow
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/user_default.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User Name
                      Text(
                        'Muhammad Anfal',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      // Membership Info
                      Text(
                        'Member since Dec 02, 2002',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      // "See Profile" Action
                      GestureDetector(
                        onTap: () {
                          // Add your navigation logic here
                        },
                        child: Row(
                          children: [
                            Text(
                              'See profile',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Icon(Icons.arrow_forward_ios,
                                size: 12.h, color: AppColor.primaryColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                'Read more',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: AppColor.primaryColor),
              ),
              SizedBox(width: 6.w),
              Icon(
                Icons.arrow_forward_ios,
                size: 11.h,
                color: AppColor.primaryColor,
              )
            ],
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: _buildBannerImage(context, 'assets/images/home_banner.jpg'),
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Text(
            'Location',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, size: 11.h),
                  SizedBox(width: 6.w),
                  Text(
                    'Johr Town Lahore',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ),
              Text(
                'Ad ID: 1293821998',
                style: TextStyle(fontSize: 10.sp),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Center(
            child: Image.asset(
              'assets/images/map.jpg',
              width: MediaQuery.of(context).size.width * 0.9.w,
              height: MediaQuery.of(context).size.height * 0.23.h,
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
                  Text(
                    'Report this ad',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.remove_red_eye_outlined, size: 14.h),
                  SizedBox(width: 6.w),
                  Text(
                    'Hide this ad',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Text(
            'Similar Cars',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
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
          Text(
            'New Cars for similar price',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: _buildBannerImage(context, 'assets/images/home_banner.jpg'),
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Text(
            'Your safety matters to us!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
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

  Widget _buildBannerImage(BuildContext context, String imagePath) {
    final imageWidget = Image.network(
      imagePath,
      fit: BoxFit.cover,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      errorBuilder: (context, error, stackTrace) =>
          _buildImagePlaceholder(context),
    );

    return imageWidget;
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
    required BuildContext context,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.44,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 20, color: AppColor.primaryColor),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImagePlaceholder(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      color: Colors.grey[100],
      child: Center(
        child: Icon(Icons.broken_image,
            size: 50, color: Colors.black.withValues(alpha: .5)),
      ),
    );
  }
}
