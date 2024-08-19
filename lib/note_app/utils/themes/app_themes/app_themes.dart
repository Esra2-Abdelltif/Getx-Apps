import 'package:flutter/material.dart';
import 'package:getx_demo_app/note_app/utils/themes/app_themes/theme_implementations/app_dark_themes.dart';
import 'package:getx_demo_app/note_app/utils/themes/app_themes/theme_implementations/app_light_themes.dart';


class AppThemes {
  static ThemeData darkTheme = AppDarkTheme.darkThemeImplementation();
  static ThemeData lightTheme = AppLightTheme.lightThemeImplementation();

}
