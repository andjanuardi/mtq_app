import 'package:flutter/material.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/screens/daftararena.dart';
import 'package:mtq_app/screens/home.dart';
import 'package:mtq_app/screens/lokasi.dart';
import 'package:mtq_app/screens/lokasiArena.dart';
import 'package:mtq_app/screens/lokasiPemondokan.dart';
import 'package:mtq_app/screens/nomorPenting.dart';
import 'package:mtq_app/widgets/bottomNav/config.dart';
import 'package:mtq_app/widgets/bottomNav/widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavProvider())
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
              primaryColor: Color.fromARGB(255, 7, 111, 10),
              // primaryColor: Color.fromRGBO(105, 148, 218, 1),
              highlightColor: Color.fromARGB(255, 102, 232, 128)),
          routes: <String, WidgetBuilder>{
            '/home': (BuildContext context) => const LayoutApp(child: Home()),
            '/daftararena': (BuildContext context) =>
                const LayoutApp(child: SafeArea(child: DaftarArena())),
            '/lokasiPemondokan': (BuildContext context) =>
                const LayoutApp(child: SafeArea(child: LokasiPemondokan())),
            '/lokasiArena': (BuildContext context) =>
                const LayoutApp(child: SafeArea(child: LokasiArena())),
            '/nomorPenting': (BuildContext context) =>
                const LayoutApp(child: SafeArea(child: NomorPenting())),
            '/lokasiMasjid': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Masjid',
                ))),
            '/lokasiFaskes': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Faskes',
                ))),
            '/lokasiKantorBupati': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Kantor Bupati ',
                ))),
            '/lokasiSPBU': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'SPBU',
                ))),
            '/lokasiATM': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'ATM',
                ))),
            '/lokasiKantorPolisi': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Kantor Polisi',
                ))),
            '/lokasiPenginapan': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Penginapan',
                ))),
            '/lokasiRumahMakan': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Rumah Makan',
                ))),
            '/lokasiWarungKafe': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Warung Kafe',
                ))),
            '/lokasiTempatWisata': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Tempat Wisata',
                ))),
            '/lokasiTerminal': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Terminal',
                ))),
            '/lokasiPelabuhan': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Pelabuhan',
                ))),
            '/lokasiBandara': (BuildContext context) => const LayoutApp(
                    child: SafeArea(
                        child: Lokasi(
                  title: 'Bandara',
                ))),
          },
          home: const LayoutApp(
            child: Home(),
          )),
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
