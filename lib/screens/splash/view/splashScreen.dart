import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopper/screens/dashboard/view_model/dashboard_view_model.dart';
import 'package:shopper/screens/home/view_model/home_view_model.dart';
import 'package:shopper/utils/common/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //navigate to home after displaying the splash screen
  }

  navigateToHome(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 1500), () {
      Provider.of<DashboardViewModel>(context, listen: false)
          .changeIndex(index: 0);
      Provider.of<HomeViewModel>(context, listen: false).getData();
      context.pushReplacement('/dashboard');
    });
  }

  bool navigate = false;
  @override
  Widget build(BuildContext context) {
    if (!navigate) {
      navigate = !navigate;
      navigateToHome(context);
    }
    return Scaffold(
      body: Container(
        color: green,
        child: Center(
          child: Text(
            'SHOPPERR',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
