//get-state
import 'package:get/state_manager.dart';
import 'package:workout_fitness_app/model/product_model.dart';
import 'package:workout_fitness_app/service/serviceController.dart';


class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products.isNotEmpty) {
        productList.value = products;
      }
    } finally {isLoading(false);}
  }
}