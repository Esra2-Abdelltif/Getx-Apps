import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:workout_fitness_app/controller/controller.dart';
import 'package:workout_fitness_app/view/product_tile.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(0.0),
          child: Text("MakeUp MVC App"),
        ),
        centerTitle: true,
        backgroundColor: Colors.black26,
        toolbarHeight: 60,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        color: Colors.black12,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Best MakeUp',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.view_list_rounded),
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(Icons.add_a_photo_outlined),
                      onPressed: () {}),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return productController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                    : SingleChildScrollView(
                        child: MasonryGridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          itemCount: productController.productList.length,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 16,
                          itemBuilder: (context, index) {
                            return ProductTile(
                                productController.productList[index]);
                          },
                          // staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                        ),
                      );
              }),
            )
          ],
        ),
      ),
    );
  }
}
