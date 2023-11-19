import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map> bottomNavIcons = [
  {
    'icon': Icon(
      Icons.home,
      color: Colors.white,
    ),
    'route': '/home',
    'label': 'Beranda',
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.compass,
      color: Colors.white,
    ),
    'route': '/kiblat',
    'label': 'Arah Kiblat',
  },
  {
    'icon': Icon(
      Icons.qr_code_scanner_sharp,
      color: Colors.white,
    ),
    'route': '/qrscan',
    'label': 'QR Scanner',
  },
  {
    'icon': Icon(
      Icons.live_tv_sharp,
      color: Colors.white,
    ),
    'route': '/live',
    'label': 'Live Streaming',
  },
  {
    'icon': Icon(
      Icons.image,
      color: Colors.white,
    ),
    'route': '/galeri',
    'label': 'Galeri',
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
