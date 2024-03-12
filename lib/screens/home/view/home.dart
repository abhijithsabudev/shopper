import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:shopper/screens/home/view/product_card.dart';
import 'package:shopper/screens/home/view_model/home_view_model.dart';
import '../../../utils/common/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    //disposing controllers
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final home = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        leading: Image.asset("assets/images/cart.png"),
        title: SizedBox(
          height: 35,
          child: TextFormField(
            textCapitalization: TextCapitalization.sentences,
            controller: _searchController,
            onTap: () {},
            keyboardAppearance: Brightness.light,
            cursorOpacityAnimates: true,
            cursorColor: Colors.green.shade400,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                ),
              ),
              counterText: '',
              fillColor: Colors.white,
              filled: true,
              prefixIcon: const SizedBox.shrink(),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 10,
                minHeight: 0,
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12.0))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12.0))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12.0))),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              suffixIconConstraints: const BoxConstraints(
                  // maxHeight: 30,
                  // maxWidth: 30,
                  ),
              contentPadding: const EdgeInsets.only(left: 0, top: 0),
              errorMaxLines: 3,
            ),
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 25,
                  )),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  height: 12,
                  width: 12,
                  child: const Center(
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 5, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: home.pageLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : ListView(
              children: [
                CustomCarouselSlider(
                  items: home.banners,
                  height: 120,
                  subHeight: 50,
                  width: MediaQuery.of(context).size.width,
                  autoplay: true,
                  showText: false,
                  showSubBackground: false,
                  indicatorShape: BoxShape.circle,
                  selectedDotColor: Colors.white,
                  unselectedDotColor: Colors.grey,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Most Popular ",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "view all",
                        style: TextStyle(fontSize: 8),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: home.popular_products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                          sku: home.popular_products[index].sku!,
                          productName: home.popular_products[index].productName,
                          productImage:
                              home.popular_products[index].productImage!,
                          productRating:
                              home.popular_products[index].productRating!,
                          actualPrice:
                              home.popular_products[index].actualPrice!,
                          offerPrice: home.popular_products[index].offerPrice!,
                          discount: home.popular_products[index].discount!);
                    },
                  ),
                ),
                home.single_banner != ""
                    ? Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Image.network(
                              fit: BoxFit.cover,
                              height: 120,
                              home.single_banner),
                        ),
                      )
                    : const SizedBox.shrink(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Featured Products",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "view all",
                        style: TextStyle(fontSize: 8),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: home.bestr_seller_products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                          sku: home.bestr_seller_products[index].sku!,
                          productName:
                              home.bestr_seller_products[index].productName,
                          productImage:
                              home.bestr_seller_products[index].productImage!,
                          productRating:
                              home.bestr_seller_products[index].productRating!,
                          actualPrice:
                              home.bestr_seller_products[index].actualPrice!,
                          offerPrice:
                              home.bestr_seller_products[index].offerPrice!,
                          discount:
                              home.bestr_seller_products[index].discount!);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
