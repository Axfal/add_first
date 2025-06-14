// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:olx_app/resources/exports.dart';
import 'package:geolocator/geolocator.dart';

class Home01 extends StatefulWidget {
  const Home01({super.key});

  @override
  State<Home01> createState() => _Home01State();
}

class _Home01State extends State<Home01> {
  String? currentLocation;

  @override
  void initState() {
    super.initState();

    // Fetch categories and banners after frame is drawn
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = this.context;
      Provider.of<CategoryProvider>(context, listen: false).getCategories();
      Provider.of<AddsProvider>(context, listen: false).getBanners();
    });

    // Automatically get current location when screen starts
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      setState(() {
        currentLocation = "Location Disabled";
      });
      return;
    }

    // Check permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
        setState(() {
          currentLocation = "Permission Denied";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied.');
      setState(() {
        currentLocation = "Permission Denied Forever";
      });
      return;
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');

    // Convert coordinates to address
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks.isNotEmpty) {
      final Placemark place = placemarks.first;
      String locationString =
          "${place.locality ?? ''}, ${place.country ?? ''}".trim();
      print("Current location: $locationString");

      setState(() {
        currentLocation =
            locationString.isEmpty ? "Unknown Location" : locationString;
      });
    } else {
      setState(() {
        currentLocation = "Unknown Location";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final addsProvider = Provider.of<AddsProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Optional: You can add location picker or refresh location here
                        getCurrentLocation();
                      },
                      child: Row(
                        children: [
                          Icon(Icons.location_on,
                              size: 16.sp, color: AppColor.primaryColor),

                          // Show currentLocation or loading text
                          Text(
                            currentLocation ?? "Fetching location...",
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.black),
                          ),

                          Icon(Icons.arrow_drop_down_sharp,
                              size: 20.sp, color: Colors.black),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            BottomSlidePage(page: const AppNotifications()));
                      },
                      icon: Icon(
                        Icons.notifications,
                        size: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(14.w),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400, width: 1.w),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, size: 22.sp),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'What are you looking for?',
                            hintStyle: TextStyle(fontWeight: FontWeight.normal),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Browse Categories',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.sp)),
                    TextButton(
                      onPressed: () {},
                      child: Text('See all',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor,
                              fontSize: 13.sp)),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: homeCategory(context, categoryProvider)),

            /// Products
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 240.h,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    autoPlayInterval: const Duration(seconds: 4),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    enableInfiniteScroll: true,
                  ),
                  items: addsProvider.addsList
                      .expand((addsModel) => addsModel.ads ?? [])
                      .where((ad) =>
                          ad.image != null && ad.image!.startsWith('https:'))
                      .map((ad) {
                    return Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailPage())),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16.r)),
                                  child: CachedNetworkImage(
                                    imageUrl: ad.image!,
                                    height: 140.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      baseColor: Colors.grey.shade200,
                                      highlightColor: Colors.grey.shade100,
                                      child: Container(
                                        height: 140.h,
                                        width: double.infinity,
                                        color: Colors.grey.shade300,
                                        child: Icon(Icons.image,
                                            size: 40.sp,
                                            color: Colors.grey.shade400),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      height: 140.h,
                                      color: Colors.grey.shade200,
                                      child: Icon(Icons.broken_image,
                                          size: 50, color: Colors.grey),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 4.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            ad.title ?? 'No Title',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        Text(
                                          ad.price != null
                                              ? 'PKR ${ad.price}'
                                              : 'No Price',
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.primaryColor,
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on,
                                                size: 14.sp,
                                                color: Colors.grey),
                                            SizedBox(width: 2.w),
                                            Expanded(
                                              child: Text(
                                                ad.location ?? 'Unknown',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 2.h),
                                        Row(
                                          children: [
                                            Icon(Icons.access_time,
                                                size: 14.sp,
                                                color: Colors.grey),
                                            SizedBox(width: 2.w),
                                            Expanded(
                                              child: Text(
                                                ad.createdAt ?? '',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),

            if (categoryProvider.getCategory != null)
              ...categoryProvider.getCategory!.categories!.map((category) {
                return SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              category.categoryName ?? "",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'See all',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 230.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: category.subcategories?.length ?? 0,
                          itemBuilder: (context, subIndex) {
                            final subCategory =
                                category.subcategories![subIndex];
                            return ProductItem(
                              imageUrl: subCategory.categoryIcon,
                              productName: subCategory.categoryName ?? "",
                              marlaKanal: "",
                              city: "",
                              daysCount: 123,
                              onTap: () {},
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
          ],
        ),
      ),
    );
  }

  Widget homeCategory(context, CategoryProvider categoryProvider) => SizedBox(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: categoryProvider.getCategory?.categories?.length ?? 0,
          itemBuilder: (context, index) {
            final category = categoryProvider.getCategory!.categories![index];
            final categoryName = category.categoryName ?? "Empty";
            final iconPath = category.categoryIcon ?? "";
            return CategoryItem(
              categoryName: categoryName,
              iconPath: iconPath,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubCategoryItems(
                            title: categoryName,
                            subcategories: category.subcategories ?? [])));
              },
            );
          },
        ),
      );
}
