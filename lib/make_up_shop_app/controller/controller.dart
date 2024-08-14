//get-state
import 'package:get/state_manager.dart';
import 'package:getx_demo_app/make_up_shop_app/model/product_model.dart';
import 'package:getx_demo_app/make_up_shop_app/service/serviceController.dart';


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