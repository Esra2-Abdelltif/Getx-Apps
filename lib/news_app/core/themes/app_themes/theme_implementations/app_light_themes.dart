import 'package:flutter/material.dart';

class AppLightTheme {
  static ThemeData lightThemeImplementation() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
     primaryColor: Colors.blue,
     hintColor: Colors.black,
      textTheme: const TextTheme(bodyMedium:TextStyle(color: Colors.black)),


    );
  }
}