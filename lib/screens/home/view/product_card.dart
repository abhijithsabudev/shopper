// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shopper/utils/common/colors.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class ProductCard extends StatelessWidget {
  String sku;
  String? productName;
  String productImage;
  int productRating;
  String actualPrice;
  String offerPrice;
  String discount;

  ProductCard({
    super.key,
    required this.sku,
    required this.productName,
    required this.productImage,
    required this.productRating,
    required this.actualPrice,
    required this.offerPrice,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 10),
      child: Container(
        width: 110,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              productImage != ""
                  ? Center(
                      child: SizedBox(
                        child: Image.network(
                            fit: BoxFit.cover,
                            height: 60,
                            width: 60,
                            productImage),
                      ),
                    )
                  : const SizedBox.shrink(),
              Container(
                decoration: BoxDecoration(
                    color: orange,
                    border: Border.all(
                      color: orange,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    discount,
                    style: const TextStyle(fontSize: 10),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Text(
                productName!,
                style: const TextStyle(fontSize: 10),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: SmoothStarRating(
                    allowHalfRating: false,
                    onRatingChanged: (v) {},
                    starCount: 5,
                    rating: productRating.toDouble(),
                    size: 13.0,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.blur_on,
                    color: Colors.amber,
                    borderColor: Colors.amber,
                    spacing: 0.0),
              ),
              Row(
                children: [
                  Text(
                    offerPrice,
                    style: const TextStyle(fontSize: 7, color: Colors.black),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  offerPrice != actualPrice
                      ? Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            actualPrice,
                            style: TextStyle(
                                fontSize: 7, color: Colors.grey.shade500),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
