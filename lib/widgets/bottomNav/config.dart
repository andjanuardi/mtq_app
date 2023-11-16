import 'package:flutter/material.dart';

List<Map> bottomNavIcons = [
  {'icon': Icons.home, 'color': Colors.white, 'route': '/home'},
  {'icon': Icons.calendar_month, 'color': Colors.white, 'route': '/jadwal'},
  {
    'icon': Icons.qr_code_scanner_sharp,
    'color': Colors.white,
    'route': '/qrscan'
  },
  {'icon': Icons.live_tv_sharp, 'color': Colors.white, 'route': '/live'},
  {'icon': Icons.image, 'color': Colors.white, 'route': '/galeri'},
];

class BottomNavProvider extends ChangeNotifier {
  int activeBottomNav;
  BottomNavProvider({
    this.activeBottomNav = 0,
  });
  void changeActiveBottomNav(int newValue) {
    activeBottomNav = newValue;
    notifyListeners();
  }
}
