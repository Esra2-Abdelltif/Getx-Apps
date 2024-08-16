import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_demo_app/news_app/core/themes/theme_controller.dart';
import 'package:getx_demo_app/news_app/utils/shared_pref_helper.dart';
import 'package:getx_demo_app/news_app/view/screens/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'news_app/core/themes/app_themes/app_themes.dart';
SharedPreferences? sharedPreferences;
void main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();
  runApp((DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
 return  GetBuilder<ThemeController>(
     init: ThemeController(),
    builder: (controller) =>  GetMaterialApp(
      builder: DevicePreview.appBuilder,
      title: 'MakeUp App Getx',
       theme:controller.isDark ?AppThemes.darkTheme:AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable ,
      transitionDuration: const Duration(milliseconds: 230),
       home:     const HomeNewsPage(),
    ));

  }
}

