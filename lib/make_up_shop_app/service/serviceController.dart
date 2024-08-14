import 'package:getx_demo_app/make_up_shop_app/model/product_model.dart';

import 'core/data/constants/api_constants/end_points.dart';
import 'package:http/http.dart' as http;
class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var response = await client.get(Uri.parse('$BASE_URL$productsEndPoint?brand=maybelline'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return [];
    }
  }
}
