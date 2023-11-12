import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/widgets/home/menuLokasi/btn.dart';
import 'package:mtq_app/widgets/home/menuLokasi/config.dart';

class MenuLokasi extends StatefulWidget {
  const MenuLokasi({
    super.key,
  });

  @override
  State<MenuLokasi> createState() => _MenuLokasiState();
}

class _MenuLokasiState extends State<MenuLokasi> {
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
                // InkWell(
                //   onTap: () {
                //     setState(() {
                //       showAll = !showAll;
                //     });
                //   },
                //   child: Container(
                //       // height: 30,
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: 10, vertical: 10),
                //       child: const Text('Lainnya')),
                // )
              ],
            ),
          ),

          SizedBox(
            height: isTablet ? 150 : 280,
            width: double.infinity,

            child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                scrollDirection: Axis.horizontal,
                crossAxisCount: isTablet ? 1 : 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.6 / 1,
                children: listMenuLokasi
                    .map((e) => BtnMenuLokasi(
                          icon: e['icon'],
                          text: e['label'],
                          url: e['url'],
                        ))
                    .toList()
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
