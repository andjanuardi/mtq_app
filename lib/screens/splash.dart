import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/config/value.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Dio dio = Dio();
  bool isLoading = true;
  int banner = 0;
  int bayar = 1;
  int versi = 0;

  Future<void> fetchData() async {
    try {
      Response response = await dio.get('$ApiUrl/config');
      if (response.statusCode == 200) {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }

        // setState(() {
        banner = int.parse(response.data['banner']);
        bayar = int.parse(response.data['bayar']);
        // });

        if (bayar == 0) {
          belumBayar(context);
          return;
        }

        if (versi != int.parse(response.data['versi'])) {
          versisalah(context);
          return;
        }

        if (banner == 1) {
          if (mounted) {
            Future.delayed(4.seconds).then((value) => showPopup(context));
            Future.delayed(8.seconds)
                .then((value) => Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/home',
                      (route) => false,
                    ));
          }
        } else {
          Future.delayed(4.seconds).then((value) =>
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false));
        }

        // if (bayar) belumBayar(context);
      } else {
        // Handle errors
        tidakadakoneksi(context);
      }
    } catch (e) {
      showmodal(context, e.toString());
    }
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    fetchData();

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > TabletWidth;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  opacity: 0.6,
                  fit: isTablet ? BoxFit.scaleDown : BoxFit.fitWidth,
                  alignment: Alignment.bottomLeft,
                  image: Image.asset(
                    'assets/images/motif/motif_lapik_bottom_left.png',
                  ).image)),
          child: Column(
            children: [
              //Content
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Stack(children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              repeat: ImageRepeat.repeatX,
                              alignment: Alignment.topRight,
                              image: Image.asset(
                                'assets/images/motif/motif_lapik2_horizontal.png',
                              ).image)),
                    ),
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              alignment: Alignment.topRight,
                              image: Image.asset(
                                'assets/images/motif/motif_lapik2_top_right.png',
                              ).image)),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(children: [
                            Image.asset(
                              'assets/images/logo/logo_tengah.png',
                              width: 200,
                            )
                                .animate()
                                .slideY(duration: 1.seconds, begin: 0.3)
                                .fade(duration: 2.seconds),
                            Image.asset(
                              'assets/images/logo/text_mtq.png',
                              width: 200,
                            )
                                .animate(delay: 2.seconds)
                                .fade(duration: 400.ms)
                                .rotate(duration: 400.ms, begin: -0.1),
                            Image.asset(
                              'assets/images/logo/text_kab.png',
                              width: 200,
                            )
                                .animate(delay: 2400.ms)
                                .fade(duration: 400.ms)
                                .rotate(duration: 400.ms, begin: -0.1),
                          ]),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/logo/pancacita.png',
                                  height: 80,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  'assets/images/logo/simeulue.png',
                                  height: 80,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  'assets/images/logo/kemenag.png',
                                  height: 80,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  'assets/images/logo/lptq.png',
                                  height: 80,
                                ),
                              ]
                                  .animate(interval: 400.ms)
                                  .slideY(duration: 500.ms, begin: 0.3)
                                  .fade(duration: 600.ms)),
                          if (isLoading)
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: CircularProgressIndicator(
                                  color: Theme.of(context).primaryColor),
                            )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              Container(
                color: Theme.of(context).primaryColor.withAlpha(200),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                child: const Text(
                  'Dinas Syari\'at Islam Kabupaten Simeulue',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              )
              //Bottom Navigation
            ],
          ),
        ),
      ),
    );
  }
}
