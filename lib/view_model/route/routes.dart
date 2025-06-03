// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:olx_app/Screens/Auth/forgot_password/forgot_password_email_screen.dart';
import 'package:olx_app/Screens/Auth/forgot_password/forgot_password_pin_code_screen.dart';
import 'package:olx_app/Screens/Auth/login_page/login_page.dart';
import 'package:olx_app/Screens/Auth/login_screen.dart';
import 'package:olx_app/Screens/Auth/signup_screen.dart';
import 'package:olx_app/Screens/Home/home_01.dart';
import 'package:olx_app/Screens/splash_screen.dart';
import 'package:olx_app/view_model/route/routes_name.dart';

import '../../Screens/Dashboard/dashboard_main.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RoutesName.dashboard:
        return MaterialPageRoute(builder: (context) => DashboardPage());
       case RoutesName.homePage:
        return MaterialPageRoute(builder: (context) => Home01());
      case RoutesName.loginPage:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RoutesName.signupScreen:
        return MaterialPageRoute(builder: (context) => SignupScreen());
      case RoutesName.forgotPasswordEmailScreen:
        return MaterialPageRoute(
            builder: (context) => ForgotPasswordEmailScreen());
      case RoutesName.forgotPasswordPinCodeScreen:
        final args = setting.arguments as Map<String, dynamic>? ?? {};
        final String email = args["email"];
        return MaterialPageRoute(
            builder: (context) => ForgotPasswordPinCodeScreen(email: email));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('no route found'),
                  ),
                ));
    }
  }
}
