import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo_app/news_app/controller/controller.dart';
import 'package:getx_demo_app/news_app/view/widget/shared_articles_screen_widget.dart';

class HomeNewsPage extends StatelessWidget {
  const HomeNewsPage({super.key});


  @override
  Widget build(BuildContext context) {
    NewsController controller=Get.put(NewsController());
    return GetX<NewsController>(builder: (controller)=> Scaffold(
        appBar: AppBar(title: const Text("news App"),),
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
    ))
    ;
  }
}
