import 'package:e/screens/splash_screen.dart';
import 'package:e/shared/shared_theme/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'E-commerce App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: SharedColors.blueColor,
            backgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
                elevation: 0.0,
                backgroundColor: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarBrightness: Brightness.dark)),
            fontFamily: 'Poppins'),
        home: const SplashScreen());
  }
}
