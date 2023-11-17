import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/screens/galeri.dart';
import 'package:mtq_app/screens/hasillomba.dart';
import 'package:mtq_app/screens/kiblat.dart';
import 'package:mtq_app/screens/live.dart';
import 'package:mtq_app/screens/nomorPenting.dart';
import 'package:mtq_app/screens/qrscan.dart';
import 'package:mtq_app/screens/splash.dart';
import 'package:mtq_app/screens/daftararena.dart';
import 'package:mtq_app/screens/home.dart';
import 'package:mtq_app/screens/jadwal.dart';
import 'package:mtq_app/screens/lokasi.dart';
import 'package:mtq_app/screens/lokasiArena.dart';
import 'package:mtq_app/screens/lokasiPemondokan.dart';
import 'package:mtq_app/screens/profilPeserta.dart';
import 'package:mtq_app/widgets/bottomNav/config.dart';
import 'package:mtq_app/widgets/bottomNav/widget.dart';
import 'package:provider/provider.dart';

void main() {
  Animate.restartOnHotReload = true;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
      ],
      child: MaterialApp(

          // onGenerateRoute: (settings) {
          //   if (settings.name == '/home')
          //     return PageRouteBuilder(
          //         pageBuilder: (_, __, ___) => LayoutApp(child: Home()));

          //   return null;
          // },
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(primaryColor: const Color(0xFF079992)),
          theme: ThemeData(
              primaryColor: const Color.fromARGB(255, 7, 111, 10),
              // primaryColor: Color.fromRGBO(105, 148, 218, 1),
              highlightColor: const Color.fromARGB(255, 102, 232, 128)),
          routes: <String, WidgetBuilder>{
            '/home': (BuildContext context) => const LayoutApp(child: Home()),
            '/daftararena': (BuildContext context) =>
                const LayoutApp(child: SafeArea(child: DaftarArena())),
            '/jadwal': (BuildContext context) =>
                const LayoutApp(child: SafeArea(child: Jadwal())),
            '/kiblat': (BuildContext context) =>
                const LayoutApp(child: SafeArea(child: Kiblat())),
            '/hasilLomba': (BuildContext context) =>
                const LayoutApp(child: SafeArea(child: HasilLomba())),
            '/galeri': (BuildContext context) =>
                const LayoutApp(child: SafeArea(child: Galeri())),
            '/live': (BuildContext context) => const LayoutApp(
                showNavBar: false, child: SafeArea(child: Live())),
            '/qrscan': (BuildContext context) => const LayoutApp(
                showNavBar: false, child: SafeArea(child: QRScan())),
            '/lokasiPemondokan': (BuildContext context) =>
                const LayoutApp(child: SafeArea(child: LokasiPemondokan())),
            '/lokasiArena': (BuildContext context) =>
                const LayoutApp(child: SafeArea(child: LokasiArena())),
            '/profilPeserta': (BuildContext context) =>
                const LayoutApp(child: SafeArea(child: ProfilPeserta())),
            '/nomorPenting': (BuildContext context) =>
                const LayoutApp(child: SafeArea(child: NomorPenting())),
            '/lokasiMasjid': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Masjid',
                  id: 3,
                ))),
            '/lokasiFaskes': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Faskes',
                  id: 4,
                ))),
            '/lokasiKantorBupati': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Kantor Bupati ',
                  id: 5,
                ))),
            '/lokasiSPBU': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'SPBU',
                  id: 6,
                ))),
            '/lokasiATM': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'ATM',
                  id: 7,
                ))),
            '/lokasiKantorPolisi': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Kantor Polisi',
                  id: 8,
                ))),
            '/lokasiPenginapan': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Penginapan',
                  id: 9,
                ))),
            '/lokasiRumahMakan': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Rumah Makan',
                  id: 10,
                ))),
            '/lokasiWarungKafe': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Warung Kafe',
                  id: 11,
                ))),
            '/lokasiTempatWisata': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Tempat Wisata',
                  id: 12,
                ))),
            '/lokasiTerminal': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Terminal',
                  id: 13,
                ))),
            '/lokasiPelabuhan': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Pelabuhan',
                  id: 14,
                ))),
            '/lokasiBandara': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Bandara',
                  id: 15,
                ))),
          },
          home: const SplashScreen()),
      // home: LayoutApp(child: Home())),
    );
  }
}

class LayoutApp extends StatelessWidget {
  final Widget child;
  final bool showNavBar;
  const LayoutApp({super.key, required this.child, this.showNavBar = true});

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > TabletWidth;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withAlpha(10),
            image: DecorationImage(
                opacity: 0.3,
                fit: isTablet ? BoxFit.scaleDown : BoxFit.fitWidth,
                alignment: Alignment.bottomLeft,
                image: Image.asset(
                  'assets/images/motif/motif_lapik_bottom_left.png',
                ).image)),
        child: Column(
          children: [
            //Content
            Expanded(
              child: Container(
                child: child,
              ),
            ),
            //Bottom Navigation
            Visibility(visible: showNavBar, child: const BottomNav())
          ],
        ),
      ),
    );
  }
}
