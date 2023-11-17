import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mtq_app/widgets/bottomNav/config.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int activeBottomNav =
        Provider.of<BottomNavProvider>(context).activeBottomNav;
    return CurvedNavigationBar(
      onTap: (index) {
        Provider.of<BottomNavProvider>(context, listen: false)
            .changeActiveBottomNav(index);
        Future.delayed(const Duration(milliseconds: 350), () {
          if (bottomNavIcons[index]['route'] == '/home') {
            Navigator.pushReplacementNamed(
              context,
              bottomNavIcons[index]['route'],
            );
          } else {
            Navigator.pushNamed(context, bottomNavIcons[index]['route']);
          }
        });
      },
      items: bottomNavIcons
          .map(
            (e) => InkWell(
              child: e['icon'],
            ),
          )
          .toList(),
      height: 55,
      index: activeBottomNav,
      color: Theme.of(context).primaryColor,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: Theme.of(context).primaryColor,
      animationDuration: const Duration(milliseconds: 300),
    );
  }
}
