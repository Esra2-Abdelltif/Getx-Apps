//get-state
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_demo_app/news_app/model/news_model.dart';
import 'package:getx_demo_app/news_app/core/data/constants/api_constants/end_points.dart';

import 'package:http/http.dart' as http;

class NewsController extends GetxController {
  RxInt currentIndex=0.obs;
  List<String>screens=[
    "sport",
    "science",
    "health",
  ];

  fetchNews({required String categoryType})async{
    final url=Uri.parse(BASE_URL(categoryType:categoryType));
    http.Response response = await http.get(url);

    if(response.statusCode==200)
    {
      try{
        return ArticleModel.fromJson(jsonDecode(response.body));

      }catch(e)
      {
        Get.snackbar("error", e.toString());
      }
    }
  }
}