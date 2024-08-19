import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppDarkTheme {
  static ThemeData darkThemeImplementation() {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme:  GoogleFonts.poppinsTextTheme(),


    );
  }
}