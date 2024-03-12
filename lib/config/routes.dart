import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/dashboard/view/dashboard.dart';
import '../screens/home/view/home.dart';
import '../screens/splash/view/splashScreen.dart';

final GoRouter routeList = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'dashboard',
          builder: (BuildContext context, GoRouterState state) {
            return const Dashboard();
          },
        ),
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const Home();
          },
        ),
      ],
    ),
  ],
);
