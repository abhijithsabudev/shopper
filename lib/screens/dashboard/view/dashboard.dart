import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopper/screens/account/view/account.dart';
import 'package:shopper/screens/cart/view/cart.dart';
import 'package:shopper/screens/category/view/category.dart';
import 'package:shopper/screens/home/view/home.dart';
import 'package:shopper/screens/offers/view/offers.dart';

import '../view_model/dashboard_view_model.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const CategoryScreen(),
    const CartScreen(),
    const OffersScreen(),
    const AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final dashboard = Provider.of<DashboardViewModel>(context);

    return Scaffold(
      bottomNavigationBar: MoltenBottomNavigationBar(
        barColor: Colors.grey.shade300,
        borderColor: Colors.transparent,
        domeCircleColor: Colors.green.shade500,
        curve: Curves.ease,
        selectedIndex: dashboard.selectedIndex,
        onTabChange: (clickedIndex) {
          dashboard.changeIndex(index: clickedIndex);
        },
        tabs: [
          MoltenTab(
              icon: const Icon(Icons.home),
              unselectedColor: Colors.grey.shade700,
              selectedColor: Colors.white),
          MoltenTab(
              icon: const Icon(Icons.window_outlined),
              unselectedColor: Colors.grey.shade700,
              selectedColor: Colors.white),
          MoltenTab(
              icon: const Icon(Icons.shopping_cart_rounded),
              unselectedColor: Colors.grey.shade700,
              selectedColor: Colors.white),
          MoltenTab(
              icon: const Icon(Icons.local_offer_rounded),
              unselectedColor: Colors.grey.shade700,
              selectedColor: Colors.white),
          MoltenTab(
              icon: const Icon(Icons.person),
              unselectedColor: Colors.grey.shade700,
              selectedColor: Colors.white),
        ],
      ),
      body: _widgetOptions.elementAt(dashboard.selectedIndex),
    );
  }
}
