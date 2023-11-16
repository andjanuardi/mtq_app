import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/widgets/home/menuLokasi/btn.dart';

class MenuLokasi extends StatefulWidget {
  const MenuLokasi({
    super.key,
  });

  @override
  State<MenuLokasi> createState() => _MenuLokasiState();
}

class _MenuLokasiState extends State<MenuLokasi> {
  Dio dio = Dio();
  List<Map<String, dynamic>> listMenuLokasi = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      Response response = await dio.get('$ApiUrl/jenislokasi');
      if (response.statusCode == 200) {
        setState(() {
          listMenuLokasi = List<Map<String, dynamic>>.from(response.data);
        });
      } else {
        // Handle errors
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width > TabletWidth;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Informasi Lokasi',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),

          SizedBox(
            height: isTablet ? 150 : 280,
            width: double.infinity,

            child: GridView.count(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                scrollDirection: Axis.horizontal,
                crossAxisCount: isTablet ? 1 : 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.6 / 1,
                children: [
                  const BtnMenuLokasi(
                    id: 1,
                    icon: 'pin-kafilah.png',
                    text: 'Lokasi Pemondokan',
                    url: '/lokasiPemondokan',
                  ),
                  const BtnMenuLokasi(
                    id: 2,
                    icon: 'quran9.png',
                    text: 'Arena Lomba',
                    url: '/lokasiArena',
                  ),
                  ...listMenuLokasi
                      .map((e) => BtnMenuLokasi(
                            id: int.parse(e['id']),
                            icon: e['ikon'],
                            text: e['jenis'],
                            url: e['url'],
                          ))
                      .toList()
                ]
                    .animate(interval: 50.ms)
                    .fade(begin: 0.5)
                    .slideX(begin: -0.3)),

            // child: GridView.builder(
            //   scrollDirection: Axis.horizontal,
            //   // shrinkWrap: true,
            //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            //   itemCount: listMenuLokasi.length,
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       mainAxisSpacing: 10,
            //       crossAxisSpacing: 10,
            //       childAspectRatio: 1.6 / 1,
            //       crossAxisCount: isTablet ? 1 : 2),
            //   itemBuilder: (context, index) => BtnMenuLokasi(
            //     icon: listMenuLokasi[index]['icon'],
            //     text: listMenuLokasi[index]['label'],
            //   ).animate().slideX(begin: -0.3),
            // )
          )

          // Wrap(
          //     spacing: 10,
          //     runSpacing: 10,
          //     direction: Axis.horizontal,
          //     children: listMenuLokasi
          //         // .take(showAll ? listMenuLokasi.length : 8)
          //         .map((e) {
          //       return (BtnMenuLokasi(icon: e['icon'], text: e['label']));
          //     }).toList()),
        ],
      ),
    );
  }
}
