// import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/main.dart';
import 'package:mtq_app/screens/hasillombapeserta.dart';

class HasilLombaGolongan extends StatefulWidget {
  const HasilLombaGolongan({super.key, required idCabang, required cabang})
      : idCabang = idCabang,
        cabang = cabang;
  final int idCabang;
  final String cabang;

  @override
  State<HasilLombaGolongan> createState() => _HasilLombaGolonganState();
}

class _HasilLombaGolonganState extends State<HasilLombaGolongan> {
  Dio dio = Dio();
  List<Map<String, dynamic>> listGolongan = [];

  Future<void> fetchData() async {
    try {
      Response response =
          await dio.get('$ApiUrl/cabang/golongan/${widget.idCabang}');
      if (response.statusCode == 200) {
        setState(() {
          listGolongan = List<Map<String, dynamic>>.from(response.data);
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
      Container(
          color: Theme.of(context).primaryColor,
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          child: Text(
            widget.cabang,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )),
      Expanded(
        child: Center(
          child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) => Column(
                    children: [
                      Card(
                          child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => LayoutApp(
                                          child: SafeArea(
                                              child: HasilLombaPeserta(
                                        idKelamin: 1,
                                        idCabang: int.parse(
                                            listGolongan[index]['id']),
                                        cabang: listGolongan[index]['cabang'] ==
                                                listGolongan[index]['golongan']
                                            ? "${listGolongan[index]['cabang']}"
                                            : "${listGolongan[index]['cabang']} ${listGolongan[index]['golongan']}",
                                      )))));
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
                                  '${listGolongan[index]['golongan']} Putra',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                      Card(
                          child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => LayoutApp(
                                          child: SafeArea(
                                              child: HasilLombaPeserta(
                                        idKelamin: 2,
                                        idCabang: int.parse(
                                            listGolongan[index]['id']),
                                        cabang: listGolongan[index]['cabang'] ==
                                                listGolongan[index]['golongan']
                                            ? "${listGolongan[index]['cabang']}"
                                            : "${listGolongan[index]['cabang']} ${listGolongan[index]['golongan']}",
                                      )))));
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
                                  '${listGolongan[index]['golongan']} Putri',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
              itemCount: listGolongan.length),
        ),
      )
    ]);
  }
}
