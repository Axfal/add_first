import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChooseAd extends StatelessWidget {
  const ChooseAd({super.key});

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
                  icon: const Icon(Icons.close, size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Choose Ad status',
                  style: TextStyle(fontSize: 20.sp),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Consumer<SelectedAdItemProvider>(
                builder: (context, provider, child) {
                  List<String> itemTexts = [
                    'All Ads',
                    'Active Ads',
                    'Inactive Ads',
                    'Pending Ads',
                    'Moderated Ads',
                    'Limited Ads',
                    'Elite Ads',
                    'Featured Ads',
                  ];

                  return Column(
                    children: List.generate(itemTexts.length, (index) {
                      final itemText = itemTexts[index];
                      bool isSelected = provider.selectedIndex == index;
                      return Column(
                        children: [
                          ListTile(
                            title: Text(itemText),
                            trailing: isSelected
                                ? Icon(Icons.check_circle, color: Colors.green)
                                : null,
                            onTap: () {
                              provider.selectItem(index);
                            },
                          ),
                          Divider(),
                        ],
                      );
                    }),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectedAdItemProvider with ChangeNotifier {
  int _selectedIndex = -1;

  int get selectedIndex => _selectedIndex;

  void selectItem(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
