// import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/main.dart';
import 'package:mtq_app/screens/hasillombagolongan.dart';
import 'package:mtq_app/screens/hasillombajuaraumum.dart';

class HasilLomba extends StatefulWidget {
  const HasilLomba({super.key});

  @override
  State<HasilLomba> createState() => _HasilLombaState();
}

class _HasilLombaState extends State<HasilLomba> {
  Dio dio = Dio();
  List<Map<String, dynamic>> listCabang = [];

  Future<void> fetchData() async {
    try {
      Response response = await dio.get('$ApiUrl/cabang');
      if (response.statusCode == 200) {
        setState(() {
          listCabang = List<Map<String, dynamic>>.from(response.data);
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
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Material(
        color: Colors.transparent,
        elevation: 2,
        child: Container(
          width: double.infinity,
          height: 57,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              opacity: 0.7,
              fit: BoxFit.fitHeight,
              alignment: const AlignmentDirectional(1.00, 1.00),
              image: Image.asset(
                'assets/images/motif/motif_lapik2_top_right.png',
              ).image,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'HASIL LOMBA',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ]),
          ),
        ),
      ).animate().fade().slide(),
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Card(
      //     child: InkWell(
      //       onTap: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (BuildContext context) => const LayoutApp(
      //                     child: SafeArea(child: HasilLombaJuaraUmum()))));
      //       },
      //       highlightColor: Colors.white,
      //       child: Container(
      //         padding: const EdgeInsets.all(10),
      //         decoration: BoxDecoration(
      //             image: DecorationImage(
      //                 alignment: Alignment.topRight,
      //                 fit: BoxFit.fitHeight,
      //                 image: Image.asset(
      //                         'assets/images/motif/motif_lapik_top_right.png')
      //                     .image)),
      //         child: Row(
      //           children: [
      //             Container(
      //               width: 40,
      //               height: 40,
      //               decoration: BoxDecoration(
      //                   image: DecorationImage(
      //                       image: Image.asset('assets/images/logo/logo.png')
      //                           .image)),
      //             ),
      //             const SizedBox(
      //               width: 10,
      //             ),
      //             const Flexible(
      //               child: Text(
      //                 'JUARA UMUM',
      //                 style:
      //                     TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: Theme.of(context).primaryColor,
          child: const Text('CABANG LOMBA',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ))),
      Expanded(
        child: Center(
          child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) => Card(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => LayoutApp(
                                  child: SafeArea(
                                      child: HasilLombaGolongan(
                                          idCabang: int.parse(
                                              listCabang[index]['id']),
                                          cabang: listCabang[index]
                                              ['nama'])))));
                    },
                    highlightColor: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              alignment: Alignment.topRight,
                              fit: BoxFit.fitHeight,
                              image: Image.asset(
                                      'assets/images/motif/motif_lapik_top_right.png')
                                  .image)),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: Image.asset(
                                            'assets/images/logo/logo.png')
                                        .image)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              listCabang[index]['nama'],
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              itemCount: listCabang.length),
        ),
      )
    ]);
  }
}
