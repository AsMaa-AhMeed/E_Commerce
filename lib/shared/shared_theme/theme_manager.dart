import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getApplicationLightTheme() {
// app bar theme
  return ThemeData(
      appBarTheme: const AppBarTheme(
    elevation: 0.0,
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ));
}
