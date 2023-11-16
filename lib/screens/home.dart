// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/models/marqueeText.dart';
import 'package:mtq_app/screens/splash.dart';
import 'package:mtq_app/widgets/home/cardArena/widget.dart';
import 'package:mtq_app/widgets/home/menuInformasi/widget.dart';
import 'package:mtq_app/widgets/home/menuLokasi/config.dart';
import 'package:mtq_app/models/slider_image.dart';
import 'package:mtq_app/widgets/home/marqueeText/widget.dart';
import 'package:mtq_app/widgets/home/menuLokasi/widget.dart';
import 'package:mtq_app/widgets/home/sliderHome/widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > TabletWidth;

    return isTablet ? const SafeArea(child: _homePage()) : const _homePage();
  }
}

class _homePage extends StatelessWidget {
  const _homePage();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SliderHome(),
      Expanded(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MarqueeText(),
            ),
            const CardArena(),
            const MenuInformasi(),
            const MenuLokasi(),
          ],
        ),
      )
    ]);
  }
}
