import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map> bottomNavIcons = [
  {
    'icon': Icon(
      Icons.home,
      color: Colors.white,
    ),
    'route': '/home'
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.compass,
      color: Colors.white,
    ),
    'route': '/kiblat'
  },
  {
    'icon': Icon(
      Icons.qr_code_scanner_sharp,
      color: Colors.white,
    ),
    'route': '/qrscan'
  },
  {
    'icon': Icon(
      Icons.live_tv_sharp,
      color: Colors.white,
    ),
    'route': '/live'
  },
  {
    'icon': Icon(
      Icons.image,
      color: Colors.white,
    ),
    'route': '/galeri'
  },
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
