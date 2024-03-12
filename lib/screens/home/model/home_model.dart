// To parse this JSON data, do
//
//     final productResponseModel = productResponseModelFromJson(jsonString);

import 'dart:convert';

List<ProductResponseModel> productResponseModelFromJson(String str) =>
    List<ProductResponseModel>.from(
        json.decode(str).map((x) => ProductResponseModel.fromJson(x)));

String productResponseModelToJson(List<ProductResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductResponseModel {
  String? type;
  String? title;
  List<Content>? contents;
  String? id;
  String? imageUrl;

  ProductResponseModel({
    this.type,
    this.title,
    this.contents,
    this.id,
    this.imageUrl,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductResponseModel(
        type: json["type"],
        title: json["title"],
        contents: json["contents"] == null
            ? []
            : List<Content>.from(
                json["contents"]!.map((x) => Content.fromJson(x))),
        id: json["id"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "contents": contents == null
            ? []
            : List<dynamic>.from(contents!.map((x) => x.toJson())),
        "id": id,
        "image_url": imageUrl,
      };
}

class Content {
  String? title;
  String? imageUrl;
  String? sku;
  String? productName;
  String? productImage;
  int? productRating;
  String? actualPrice;
  String? offerPrice;
  String? discount;

  Content({
    this.title,
    this.imageUrl,
    this.sku,
    this.productName,
    this.productImage,
    this.productRating,
    this.actualPrice,
    this.offerPrice,
    this.discount,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        title: json["title"],
        imageUrl: json["image_url"],
        sku: json["sku"],
        productName: json["product_name"],
        productImage: json["product_image"],
        productRating: json["product_rating"],
        actualPrice: json["actual_price"],
        offerPrice: json["offer_price"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image_url": imageUrl,
        "sku": sku,
        "product_name": productName,
        "product_image": productImage,
        "product_rating": productRating,
        "actual_price": actualPrice,
        "offer_price": offerPrice,
        "discount": discount,
      };
}
