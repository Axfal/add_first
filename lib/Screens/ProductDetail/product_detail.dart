import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Providers/product_scroller.dart';
import 'package:olx_app/Screens/ProductDetail/product_detail_content.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductScrollProvider(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<ProductScrollProvider>(
          builder: (context, provider, _) {
            return NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  final isExpanded = scrollNotification.metrics.pixels > 100.h;
                  provider.updateAppBarState(isExpanded);
                }
                return true;
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 220.h,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        children: [
                          PageView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            onPageChanged: (index) {
                              provider.updateImagePage(index + 1);
                            },
                            itemBuilder: (context, index) {
                              final images = [
                                "assets/images/books.png",
                                "assets/images/clothing.png",
                                "assets/images/profile.jpg",
                                "assets/images/books.png",
                                "assets/images/user_default.png",
                              ];
                              return Image.asset(
                                images[index],
                                fit: BoxFit.cover,
                              );
                            },
                          ),

                          Positioned(
                            bottom: 8.h,
                            left: 13.w,
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.orangeAccent,
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                                  child: Text(
                                    "Featured",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 8.h,
                            right: 13.w,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                              child: Row(
                                children: [
                                  Icon(Icons.camera_alt_outlined, size: 12.h),
                                  SizedBox(width: 4.w),
                                  Text(
                                    "${provider.currentImagePage}/5",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: provider.isAppBarExpanded ? Colors.white : Colors.transparent,
                    elevation: provider.isAppBarExpanded ? 1 : 0,
                    shadowColor: provider.isAppBarExpanded ? Colors.black.withOpacity(0.4) : Colors.transparent,
                    pinned: true,
                    title: provider.isAppBarExpanded
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product Title",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Product Subtitle",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    )
                        : null,
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: provider.isAppBarExpanded ? Colors.black : Colors.white,
                      ),
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.favorite_border,
                          color: provider.isAppBarExpanded ? Colors.black : Colors.white,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.share,
                          color: provider.isAppBarExpanded ? Colors.black : Colors.white,
                        ),
                      ),
                      SizedBox(width: 16.w),
                    ],
                  ),
                  const SliverToBoxAdapter(
                    child: ProductDetailContent(),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          height: 60.h,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOutlinedButton(
                context,
                icon: Icons.mail,
                text: "SMS",
                onPressed: () {},
              ),
              _buildOutlinedButton(
                context,
                icon: Icons.phone,
                text: "Call",
                onPressed: () {},
              ),
              _buildFilledButton(
                context,
                icon: Icons.message,
                text: "Chat",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOutlinedButton(BuildContext context,
      {required IconData icon,
        required String text,
        required VoidCallback onPressed}) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 14.h, color: Colors.black),
      label: Text(
        text,
        style: TextStyle(fontSize: 12.sp, color: Colors.black),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
    );
  }

  Widget _buildFilledButton(BuildContext context,
      {required IconData icon,
        required String text,
        required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 14.h, color: Colors.white),
      label: Text(
        text,
        style: TextStyle(fontSize: 12.sp, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
    );
  }
}