import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:shopper/screens/home/model/product_model.dart';

import '../domain/home_domain.dart';

class HomeViewModel extends ChangeNotifier {
  List<dynamic>? response;
  List<CarouselItem> banners = [];
  List<Product> popular_products = [];
  List<Product> bestr_seller_products = [];
  String single_banner = '';
  bool pageLoading = true;

  getData() async {
    if (!pageLoading) {
      pageLoading = true;
      notifyListeners();
    }
    response = await AuthRepository().getData();
    if (response != null) {
      // debugPrint(response);
      for (var element in response!) {
        debugPrint(element["type"]);
        if (element["type"] == "banner_slider") {
          for (var element in element["contents"]!) {
            banners.add(
              CarouselItem(
                image: NetworkImage(
                  element["image_url"].toString(),
                ),
              ),
            );
          }
        } else if (element["type"] == "banner_single") {
          single_banner = element["image_url"];
        } else if (element["type"] == "products" &&
            element["title"] == "Best Sellers") {
          for (var element in element["contents"]!) {
            bestr_seller_products.add(Product(
              sku: element["sku"] ?? "",
              productName: element["product_name"] ?? "",
              productImage: element["product_image"] ?? "",
              productRating: element["product_rating"] ?? 0,
              actualPrice: element["actual_price"] ?? "",
              offerPrice: element["offer_price"] ?? "",
              discount: element["discount"] ?? "",
            ));
          }
        } else if (element["type"] == "products" &&
            element["title"] == "Most Popular") {
          for (var element in element["contents"]!) {
            popular_products.add(Product(
              sku: element["sku"] ?? "",
              productName: element["product_name"] ?? "",
              productImage: element["product_image"] ?? "",
              productRating: element["product_rating"] ?? "",
              actualPrice: element["actual_price"] ?? "",
              offerPrice: element["offer_price"] ?? "",
              discount: element["discount"] ?? "",
            ));
          }
        }
      }
      pageLoading = false;
      notifyListeners();
    }
    pageLoading = false;
    notifyListeners();
  }
}
