// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/resources/color.dart';
import 'package:provider/provider.dart';
import 'package:olx_app/Providers/product_scroller.dart';
import 'package:olx_app/Screens/ProductDetail/product_detail_content.dart';

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
                  provider.updateAppBarState(
                      scrollNotification.metrics.pixels > 100.h);
                }
                return true;
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 240.h,
                    pinned: true,
                    elevation: provider.isAppBarExpanded ? 1 : 0,
                    backgroundColor: provider.isAppBarExpanded
                        ? Colors.white
                        : Colors.transparent,
                    shadowColor: Colors.black.withValues(alpha: 0.1),
                    leading: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: provider.isAppBarExpanded
                            ? Colors.grey.shade200
                            : Colors.black.withValues(alpha: 0.5),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: provider.isAppBarExpanded
                              ? Colors.black
                              : Colors.white,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    actions: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 8),
                        decoration: BoxDecoration(
                          color: provider.isAppBarExpanded
                              ? Colors.grey.shade200
                              : Colors.black.withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: provider.isAppBarExpanded
                                ? Colors.black
                                : Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(right: 8, top: 8, bottom: 8),
                        decoration: BoxDecoration(
                          color: provider.isAppBarExpanded
                              ? Colors.grey.shade200
                              : Colors.black.withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.share_outlined,
                            color: provider.isAppBarExpanded
                                ? Colors.black
                                : Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          PageView.builder(
                            itemCount: 5,
                            onPageChanged: (index) =>
                                provider.updateImagePage(index + 1),
                            itemBuilder: (context, index) {
                              final images = [
                                "assets/images/books.png",
                                "assets/images/clothing.png",
                                "assets/images/profile.jpg",
                                "assets/images/books.png",
                                "assets/images/user_default.png",
                              ];
                              return ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.r),
                                  bottomRight: Radius.circular(20.r),
                                ),
                                child: (!images[index].contains('http') ||
                                        images[index].isEmpty)
                                    ? Icon(Icons.broken_image,
                                        size: 50,
                                        color:
                                            Colors.black.withValues(alpha: 0.5))
                                    : Image.network(
                                        images[index],
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Center(
                                            child: Icon(Icons.broken_image,
                                                size: 50,
                                                color: Colors.black
                                                    .withValues(alpha: 0.5)),
                                          );
                                        },
                                      ),
                              );
                            },
                          ),
                          Positioned(
                            bottom: 12.h,
                            left: 16.w,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: Colors.orange.withValues(alpha: 0.9),
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Text(
                                "Featured",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 12.h,
                            right: 16.w,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.camera_alt_outlined,
                                      size: 12.sp, color: Colors.white),
                                  SizedBox(width: 4.w),
                                  Text(
                                    "${provider.currentImagePage}/5",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                                  color: Colors.grey[600],
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          )
                        : null,
                  ),
                  const SliverToBoxAdapter(child: ProductDetailContent()),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            height: 70.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, -3),
                ),
              ],
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconButton(context,
                    icon: Icons.mail_outline, text: "SMS", onPressed: () {}),
                _buildIconButton(context,
                    icon: Icons.phone_outlined, text: "Call", onPressed: () {}),
                _buildFilledButton(context,
                    icon: Icons.message_outlined,
                    text: "Chat",
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(BuildContext context,
      {required IconData icon,
      required String text,
      required VoidCallback onPressed}) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18.sp, color: Colors.black),
      label: Text(
        text,
        style: TextStyle(fontSize: 13.sp, color: Colors.black),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        side: const BorderSide(color: Colors.black12),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      ),
    );
  }

  Widget _buildFilledButton(BuildContext context,
      {required IconData icon,
      required String text,
      required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18.sp, color: Colors.white),
      label: Text(
        text,
        style: TextStyle(
            fontSize: 13.sp, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      ),
    );
  }
}
