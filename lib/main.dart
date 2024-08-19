import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_demo_app/note_app/utils/shared_pref_helper.dart';
import 'package:getx_demo_app/note_app/utils/themes/theme_controller.dart';
import 'package:getx_demo_app/note_app/view/screen/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'note_app/utils/themes/app_themes/app_themes.dart';
SharedPreferences? sharedPreferences;
void main() async{
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarBrightness: Brightness.light,statusBarColor: Colors.white));
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
      title: 'Getx App',
       theme:controller.isDark ?AppThemes.darkTheme:AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable ,
      transitionDuration: const Duration(milliseconds: 230),
       home: NoteHomepage(),
    ));

  }
}

