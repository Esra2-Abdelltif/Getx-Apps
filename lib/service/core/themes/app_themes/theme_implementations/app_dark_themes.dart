import 'package:flutter/material.dart';

class AppDarkTheme {
  static ThemeData darkThemeImplementation() {
    return ThemeData.dark().copyWith(
     primaryColor: Colors.blue,
     hintColor: Colors.white,
      textTheme: const TextTheme(bodyMedium:TextStyle(color: Colors.white)),


    );
  }
}