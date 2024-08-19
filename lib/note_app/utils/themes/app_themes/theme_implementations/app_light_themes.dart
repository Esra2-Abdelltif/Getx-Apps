import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppLightTheme {
  static ThemeData lightThemeImplementation() {
    return ThemeData.light().copyWith(
     primaryColor: Colors.blue,
     visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme:  GoogleFonts.poppinsTextTheme(),


    );
  }
}