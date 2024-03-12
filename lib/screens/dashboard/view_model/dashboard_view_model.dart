import 'package:flutter/material.dart';

class DashboardViewModel extends ChangeNotifier {
  int selectedIndex = 0;
  changeIndex({required int index}) {
    selectedIndex = index;
    notifyListeners();
  }
}
