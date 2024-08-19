import 'package:get/get.dart';
import 'package:getx_demo_app/note_app/utils/themes/app_themes/app_themes.dart';
import 'package:getx_demo_app/note_app/utils/shared_pref_helper.dart';


class ThemeController extends GetxController {
  bool isDark = false;

  @override
  void onInit() async {
    super.onInit();
    isDark = SharedPrefHelper.isDarkTheme();
    Get.changeTheme(isDark ? AppThemes.darkTheme : AppThemes.lightTheme);
  }

  void changeTheme(bool _isDark) async {
    isDark = _isDark;
    await SharedPrefHelper.cacheTheme(_isDark);
    Get.changeTheme(_isDark ? AppThemes.darkTheme : AppThemes.lightTheme);
    update();
  }
}