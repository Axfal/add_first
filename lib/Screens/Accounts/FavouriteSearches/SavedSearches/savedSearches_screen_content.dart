import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Widgets/saved_searches_item.dart';

class SavedsearchesScreenContent extends StatelessWidget {
  const SavedsearchesScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 8.h),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                SavedSearchesItem(
                  leftText: 'suzuki car in Sabzazar',
                  rightIcon: Icons.delete_outline,
                  secondRowLeftText: 'Category',
                  secondRowRightText: 'Kids Cars',
                  thirdRowLeftText: 'Keywords',
                  thirdRowRightText: 'Jobs',
                ),
                SizedBox(height: 12),
                SavedSearchesItem(
                  leftText: 'suzuki car in Sabzazar',
                  rightIcon: Icons.delete_outline,
                  secondRowLeftText: 'Category',
                  secondRowRightText: 'Kids Cars',
                  thirdRowLeftText: 'Keywords',
                  thirdRowRightText: 'Jobs',
                ),
                SizedBox(height: 12),
                SavedSearchesItem(
                  leftText: 'suzuki car in Sabzazar',
                  rightIcon: Icons.delete_outline,
                  secondRowLeftText: 'Category',
                  secondRowRightText: 'Kids Cars',
                  thirdRowLeftText: 'Keywords',
                  thirdRowRightText: 'Jobs',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
