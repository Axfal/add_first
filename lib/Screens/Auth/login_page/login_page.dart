// ignore_for_file: avoid_print

import 'package:olx_app/resources/exports.dart';
import 'package:olx_app/Screens/Auth/signup_page_01.dart';
import 'package:olx_app/Widgets/login_signup.dart';
import 'package:olx_app/view_model/route/routes_name.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoginSignup(
          title: 'Log in to your OLX account',
          googleText: 'Log In with Google',
          facebookText: 'Log In with Facebook',
          emailText: 'Log In with Email',
          phoneText: 'Log In with Phone',
          onGoogleTap: () {
            print('Google button tapped');
          },
          onFacebookTap: () {
            print('Facebook button tapped');
          },
          onEmailTap: () {
            Navigator.pushNamed(context, RoutesName.loginScreen);
            print('Email button tapped');
          },
          onPhoneTap: () {
            print('Phone button tapped');
          },
          bottomText: 'New to OLX? Create an account',
          onBottomTextTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const SignupPage01(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;
      
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);
      
                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );
          },
          agreementTextVisibility: false,
          onTermsTap: () {
            print('Terms and Conditions tapped');
          },
          onPrivacyPolicyTap: () {
            print('Privacy Policy tapped');
          },
        ),
      ),
    );
  }
}
