import 'package:e/home_screen.dart';
import 'package:e/screens/splash_screen.dart';
import 'package:e/user_view/login.dart';
import 'package:e/user_view/signup.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String homeScreen = '/homeScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signupRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Not Found Page')),
            body: const Center(child: Text('Not Found Page'))));
  }
}
