import 'dart:convert';

import 'package:get/get.dart';
List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Product {
  // int? id;
  String? name;
  String? price;
  // dynamic priceSign;
  // dynamic currency;
  String? imageLink;
  // String? productLink;
  // String? websiteLink;
  // String? description;
   double? rating;
  // String? category;
  // String? productType;
  // List<dynamic>? tagList;
  // DateTime? createdAt;
  // DateTime? updatedAt;
  // String? productApiUrl;
  // String? apiFeaturedImage;

  Product(
      {
        // this.id,
        this.name,
        this.price,
        // this.priceSign,
        // this.currency,
        this.imageLink,
        // this.productLink,
        // this.websiteLink,
        // this.description,
        this.rating,
        // this.category,
        // this.createdAt,
        // this.updatedAt,
        // this.productApiUrl,
        // this.apiFeaturedImage,
        // this.productType,
        // this.tagList
        });
  var isFavorite = false.obs;
  Product.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    name = json['name'];
    price = json['price'];
    // priceSign = json['price_sign'];
    // currency = json['currency'];
    imageLink = json['image_link'];
    // productLink = json['product_link'];
    // websiteLink = json['website_link'];
    // description = json['description'];
    rating = json['rating'];
    // category = json['category'];
    // productType = json['product_type'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // productApiUrl = json['product_api_url'];
    // apiFeaturedImage = json['api_featured_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    // data['price_sign'] = priceSign;
    // data['currency'] = currency;
    data['image_link'] = imageLink;
    // data['product_link'] = productLink;
    // data['website_link'] = websiteLink;
    // data['description'] = description;
    data['rating'] = rating;
    // data['category'] = category;
    // data['product_type'] = productType;
    // data['created_at'] = createdAt;
    // data['updated_at'] = updatedAt;
    // data['product_api_url'] = productApiUrl;
    // data['api_featured_image'] = apiFeaturedImage;
    return data;
  }
}