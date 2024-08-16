import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo_app/news_app/controller/controller.dart';
import 'package:getx_demo_app/news_app/model/news_model.dart';

class SharedArticlesScreenWidget extends StatelessWidget {
  final String categoryType;
  const SharedArticlesScreenWidget({super.key,required this.categoryType});

  @override
  Widget build(BuildContext context) {
    NewsController controller=Get.put(NewsController());
    return FutureBuilder(
        future: controller.fetchNews(categoryType: categoryType),
        builder: (context,AsyncSnapshot snapshot)
        {
          ArticleModel data=snapshot.data;
          if(snapshot.hasData)
          {
            return ListView.builder(
              key: PageStorageKey<String>(categoryType) ,
                itemCount: data.articles!.length,
                itemBuilder:(context,int index)
                {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            data.articles![index].urlToImage==null?Container():  SizedBox(
                              width: double.infinity,
                              height: 150,
                              child: Image.network(
                                data.articles![index].urlToImage.toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Text(
                              data.articles![index].title??"",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textDirection: TextDirection.rtl,

                            ),
                            Text(
                              data.articles![index].description ??"",
                              style: const TextStyle(
                                  fontSize: 15,color: Colors.grey),
                              textDirection: TextDirection.rtl,

                            ),

                          ],
                        ),
                      ),
                    ),
                  );
                } );
          }
          else{
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
