import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_demo_app/make_up_shop_app/view/homePage.dart';
import 'make_up_shop_app/service/core/themes/app_themes/app_themes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
  WidgetsFlutterBinding.ensureInitialized();


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
 return   GetMaterialApp(
      builder: DevicePreview.appBuilder,
      title: 'MakeUp App Getx',
      theme:AppThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable ,
      transitionDuration: const Duration(milliseconds: 230),
       home:    Homepage(),
    );

  }
}

