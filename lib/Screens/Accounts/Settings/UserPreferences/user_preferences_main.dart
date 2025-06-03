import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_app/Screens/Accounts/Settings/UserPreferences/provider/slider.dart';
import 'package:provider/provider.dart';

class UserPreferencesMain extends StatelessWidget {
  const UserPreferencesMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SliderProvider(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'User Preferences',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Font size',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Text('A', style: TextStyle(fontSize: 12.sp)),
                  Expanded(
                    child: Consumer<SliderProvider>(
                      builder: (context, provider, child) {
                        return SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 3.h,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 6),
                          ),
                          child: Slider(
                            value: provider.sliderValue,
                            min: 0.0,
                            max: 1.0,
                            onChanged: provider.updateSliderValue,
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey[300],
                          ),
                        );
                      },
                    ),
                  ),
                  Text('A', style: TextStyle(fontSize: 14.sp)),
                ],
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
