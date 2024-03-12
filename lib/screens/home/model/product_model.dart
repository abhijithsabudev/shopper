class Product {
  String? sku;
  String? productName;
  String? productImage;
  int? productRating;
  String? actualPrice;
  String? offerPrice;
  String? discount;

  Product({
    required this.sku,
    required this.productName,
    required this.productImage,
    required this.productRating,
    required this.actualPrice,
    required this.offerPrice,
    required this.discount,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        sku: json["sku"],
        productName: json["product_name"],
        productImage: json["product_image"],
        productRating: json["product_rating"],
        actualPrice: json["actual_price"],
        offerPrice: json["offer_price"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "sku": sku,
        "product_name": productName,
        "product_image": productImage,
        "product_rating": productRating,
        "actual_price": actualPrice,
        "offer_price": offerPrice,
        "discount": discount,
      };
}
