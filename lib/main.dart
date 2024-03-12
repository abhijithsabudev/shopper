import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopper/screens/dashboard/view_model/dashboard_view_model.dart';
import 'config/routes.dart';
import 'screens/home/view_model/home_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Shopper());
}

class Shopper extends StatelessWidget {
  const Shopper({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => HomeViewModel()),
            ChangeNotifierProvider(create: (_) => DashboardViewModel()),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: routeList,
            title: 'shopper',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          ),
        );
      },
    );
  }
}
