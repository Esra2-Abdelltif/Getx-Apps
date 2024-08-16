import 'package:get/get.dart';
import 'package:getx_demo_app/news_app/core/themes/theme_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController(), fenix: true);
  }
}