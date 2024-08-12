import 'package:workout_fitness_app/model/product_model.dart';
import 'package:workout_fitness_app/service/remote/api/api_helper_implementation..dart';

import 'core/data/constants/api_constants/end_points.dart';
import 'package:http/http.dart' as http;
// class RemoteServices {
//   static var client = http.Client();
//
//   static Future<List<Product>> fetchProducts() async {
//     var response = await client.get(Uri.parse(
//         'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
//     if (response.statusCode == 200) {
//       var jsonString = response.body;
//       return productFromJson(jsonString);
//     } else {
//       //show error message
//       return [];
//     }
//   }
// }
class RemoteServices {
  static  ApiHelperImplementation apiService = ApiHelperImplementation();

  static Future<List<Product>> fetchProducts() async {
    var response = await apiService.get(
      endPoint: productsEndPoint,
        data:{
        "brand":"maybelline"
        } ,
    );
    if (response.statusCode == 200) {
      return productFromJson(response);
    } else {
      //show error message
      return productFromJson(response);
    }
  }
}