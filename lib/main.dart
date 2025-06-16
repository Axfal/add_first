import 'Providers/auth_provider/sign_in_otp_provider.dart';
import 'Providers/auth_provider/verify_otp_provider.dart';
import 'package:olx_app/resources/exports.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatTabProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => PageIndexProvider()),
        ChangeNotifierProvider(create: (_) => SelectedAdItemProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => SignInOtpProvider()),
        ChangeNotifierProvider(create: (_) => VerifyOtpProvider()),
        ChangeNotifierProvider(create: (_) => AddsProvider()),
        ChangeNotifierProvider(create: (_) => AttributeProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          scaffoldMessengerKey: GlobalVariables.scaffoldMessengerKey,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: RoutesName.splashScreen,
          onGenerateRoute: Routes.generateRoute,
          // home: const LoginPage01(),
        );
      },
    );
  }
}

class GlobalVariables {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
}
