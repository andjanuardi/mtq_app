// import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mtq_app/config/value.dart';

class Jadwal extends StatefulWidget {
  const Jadwal({super.key});

  @override
  State<Jadwal> createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  Dio dio = Dio();
  List<Map<String, dynamic>> listJadwal = [];

  Future<void> fetchData() async {
    try {
      Response response = await dio.get('$ApiUrl/jadwal');
      if (response.statusCode == 200) {
        setState(() {
          listJadwal = List<Map<String, dynamic>>.from(response.data);
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.calendar_month,
                  size: 24,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'AGENDA / JADWAL',
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
      Expanded(
        child: Center(
          child: ListView.builder(
            itemCount: listJadwal.length,
            itemBuilder: (context, index) => Container(
                child: Column(
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  padding: EdgeInsetsDirectional.all(10),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Symbols.calendar_month,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                          child: Text(
                        tanggalStr(listJadwal[index]['tanggal']),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                ),
                ...listJadwal[index]['lokasi']!.map(
                  (e) => Card(
                    clipBehavior: Clip.hardEdge,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              opacity: 0.1,
                              alignment: Alignment.bottomLeft,
                              image: Image.asset(
                                'assets/images/motif/motif_lapik_bottom_left.png',
                              ).image)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Theme.of(context).primaryColor.withAlpha(80),
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${e['lokasi']}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${e['alamat']}',
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      openDirection(double.parse(e['lat']),
                                          double.parse(e['long']));
                                    },
                                    icon: Icon(
                                      Icons.pin_drop,
                                    ))
                              ],
                            ),
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...e['kegiatan'].map(
                                    (kegiatan) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  tanggalStr(listJadwal[index]
                                                      ['tanggal']),
                                                ),
                                              ),
                                              Text(
                                                '${kegiatan['jam']}',
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '${kegiatan['kegiatan']}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
      )
    ]);
  }
}
