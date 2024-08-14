import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:getx_demo_app/make_up_shop_app/controller/controller.dart';
import 'package:getx_demo_app/make_up_shop_app/view/product_tile.dart';
import 'package:getx_demo_app/news_app/controller/controller.dart';
import 'package:getx_demo_app/news_app/view/widget/shared_articles_screen_widget.dart';

class HomeNewsPage extends StatelessWidget {
  const HomeNewsPage({super.key});


  @override
  Widget build(BuildContext context) {
    List<String>screens=[
      "sport",
      "science",
      "health",
    ];
    NewsController controller=Get.put(NewsController());
    return Scaffold(
        bottomNavigationBar:BottomNavigationBar(
          selectedItemColor: Colors.red,
          currentIndex: controller.currentIndex.value,
          onTap: (val)
          {
            controller.currentIndex.value=val;
          },
          items: const [
            BottomNavigationBarItem(
                label: "Sports",
                icon: Icon(Icons.sports)),
            BottomNavigationBarItem(
                label: "Science",
                icon: Icon(Icons.science)),
            BottomNavigationBarItem(
                label: "health",
                icon: Icon(Icons.health_and_safety)),
          ],

        ),
        body: GetX<NewsController>(builder: (controller)=> SharedArticlesScreenWidget(
          categoryType:controller.screens[controller.currentIndex.value],
        ))
    )
    ;
  }
}
