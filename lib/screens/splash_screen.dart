import 'package:e/home_screen.dart';
import 'package:e/shared/shared_theme/shared.dart';
import 'package:e/user_view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initApp();
  }

  void initApp() {
    Future.delayed(const Duration(seconds: 3), () async {
      final prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.get('user_access_token');
      if (accessToken == null) {
        // Navigator.pushReplacementNamed(context, Routes.loginRoute);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }), (route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }), (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.blueColor,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: SharedColors.blueColor,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: SharedColors.whiteColor,
              statusBarBrightness: Brightness.dark)),
      body: Center(child: Image.asset('assets/images/logo2.png', height: 90)),
    );
  }
}
