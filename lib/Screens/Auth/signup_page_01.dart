import 'package:flutter/material.dart';
import 'package:olx_app/Screens/Auth/LoginWithPhone/enter_phone.dart';
import 'package:olx_app/Screens/Auth/login_page/login_page.dart';
import 'package:olx_app/Widgets/login_signup.dart';
import 'package:olx_app/Widgets/slide_page_route.dart';

class SignupPage01 extends StatelessWidget {
  const SignupPage01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginSignup(
        title: 'Create a new OLX account',
        googleText: 'Join with Google',
        facebookText: 'Join with Facebook',
        emailText: 'Join with Email',
        phoneText: 'Join with Phone',
        onGoogleTap: () {
          print('Google button tapped');
        },
        onFacebookTap: () {
          print('Facebook button tapped');
        },
        onEmailTap: () {
          print('Email button tapped');
        },
        onPhoneTap: () {
          Navigator.of(context).push(SlidePageRoute(page: const EnterPhone()));
        },
        bottomText: 'Already have an account? Log in',
        onBottomTextTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        },
        agreementTextVisibility: true,
        onTermsTap: () {
          print('Terms and Conditions tapped');
        },
        onPrivacyPolicyTap: () {
          print('Privacy Policy tapped');
        },
      ),
    );
  }
}
