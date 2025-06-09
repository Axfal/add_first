// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/resources/color.dart';
import 'package:provider/provider.dart';

import '../../Widgets/app_bar.dart';

class ChooseAd extends StatelessWidget {
  const ChooseAd({super.key});

  // PreferredSizeWidget buildAppBar(BuildContext context, String title) {
  //   final colors = Theme.of(context).colorScheme;
  //   return AppBar(
  //     backgroundColor: colors.surface,
  //     elevation: 1,
  //     leading: InkWell(
  //       borderRadius: BorderRadius.circular(24.r),
  //       onTap: () => Navigator.pop(context),
  //       child: Padding(
  //         padding: EdgeInsets.all(8.w),
  //         child: Icon(Icons.close, color: colors.onSurface, size: 26.sp),
  //       ),
  //     ),
  //     title: Text(
  //       title,
  //       style: TextStyle(
  //         fontSize: 22.sp,
  //         fontWeight: FontWeight.w700,
  //         color: colors.onSurface,
  //         letterSpacing: 0.5,
  //       ),
  //     ),
  //     centerTitle: false,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final adStatuses = [
      'All Ads',
      'Active Ads',
      'Inactive Ads',
      'Pending Ads',
      'Moderated Ads',
      'Limited Ads',
      'Elite Ads',
      'Featured Ads',
    ];

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: buildAppBar(context, "Choose Ad status"),
      body: SafeArea(
        child: Consumer<SelectedAdItemProvider>(
          builder: (context, provider, _) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              itemCount: adStatuses.length,
              separatorBuilder: (_, __) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                final isSelected = provider.selectedIndex == index;
                final statusText = adStatuses[index];

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColor.primaryColor.withValues(alpha: 0.1) : colors.surface,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: isSelected
                        ? [
                      BoxShadow(
                        color: AppColor.primaryColor.withValues(alpha: 0.25),
                      ),
                    ]
                        : [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    border: isSelected
                        ? Border.all(color: AppColor.primaryColor, width: 2)
                        : Border.all(color: Colors.transparent),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16.r),
                      onTap: () => provider.selectItem(index),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                statusText,
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                                  color: isSelected ? AppColor.primaryColor : colors.onSurface,
                                ),
                              ),
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: isSelected
                                  ? Icon(
                                Icons.check_circle,
                                color: AppColor.primaryColor,
                                size: 26.sp,
                                key: ValueKey('selected_$index'),
                              )
                                  : SizedBox.shrink(key: ValueKey('unselected_$index')),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class SelectedAdItemProvider extends ChangeNotifier {
  int _selectedIndex = -1;

  int get selectedIndex => _selectedIndex;

  void selectItem(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners();
    }
  }
}
