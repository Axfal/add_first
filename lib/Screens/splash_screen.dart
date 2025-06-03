// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:olx_app/resources/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();

    // Start animation
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )
      ..addListener(() {
        setState(() {
          currentIndex = (currentIndex + 1) % 3;
        });
      })
      ..repeat();

    // Navigate after delay
    Timer(Duration(seconds: 3), () {
      checkLoginStatus();
    });
  }

  Future<void> checkLoginStatus() async {
    print('Checking login status...');
    final localDatabase = MySharedPrefs();
    bool isLoggedIn = await localDatabase.isUserLoggedIn();
    print('Is logged in? $isLoggedIn');

    if (!mounted) return;

    if (isLoggedIn) {
      print('Navigating to dashboard');
      Navigator.pushReplacementNamed(context, RoutesName.dashboard);
    } else {
      print('Navigating to login screen');
      Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_splash.png',
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: currentIndex == index ? 12 : 8,
                  width: currentIndex == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index ? Colors.white : Colors.grey,
                    borderRadius: BorderRadius.circular(6),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
