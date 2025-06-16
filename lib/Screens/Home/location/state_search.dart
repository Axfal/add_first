// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:olx_app/resources/exports.dart';

class LocationOverlay2 extends StatefulWidget {
  final String country;
  final VoidCallback onClose;

  const LocationOverlay2({super.key, required this.onClose, required this.country});

  @override
  State<LocationOverlay2> createState() => _LocationOverlayState();
}

class _LocationOverlayState extends State<LocationOverlay2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  late TextEditingController _searchController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    _searchController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LocationProvider>(context, listen: false)
          .getLocation('state', country: widget.country);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Widget buildResults() {
    final locationProvider = Provider.of<LocationProvider>(context);
    final stateModel = locationProvider.stateModel;

    if (locationProvider.isLoading) {
      return Center(child: CupertinoActivityIndicator());
    }

    if (stateModel == null || stateModel.data.states.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            "No data found!",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      );
    }

    final filteredStates = stateModel.data.states
        .where((state) =>
            state.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    if (filteredStates.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            "No matching results!",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredStates.length,
      padding: EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w),
      itemBuilder: (context, index) {
        final state = filteredStates[index];

        return GestureDetector(
          onTap: () async {},
          child: Container(
            margin: EdgeInsets.only(bottom: 14.h),
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  blurRadius: 10,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        AppColor.primaryColor.withOpacity(0.15),
                        AppColor.primaryColor.withOpacity(0.05),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.primaryColor.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.white,
                    child: Text(
                      state.name.substring(0, 2).toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: AppColor.primaryColor,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    state.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    size: 16.sp, color: Colors.grey),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Scaffold(
            backgroundColor: Colors.grey.shade100.withOpacity(0.98),
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 60.h,
                    margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: widget.onClose,
                          icon: Icon(Icons.arrow_back_ios,
                              color: AppColor.primaryColor, size: 24.sp),
                          splashRadius: 24,
                          padding: EdgeInsets.all(8),
                          constraints: BoxConstraints(),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            onChanged: (value) {
                              setState(() {
                                _searchQuery = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Search state...',
                              prefixIcon: Icon(Icons.search,
                                  color: AppColor.primaryColor, size: 24.sp),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 16.h),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide:
                                BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: BorderSide(
                                    color: AppColor.primaryColor, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: buildResults()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
