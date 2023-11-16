// import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/config/value.dart';

class HasilLombaPeserta extends StatefulWidget {
  const HasilLombaPeserta(
      {super.key, required cabang, required idCabang, required idKelamin})
      : cabang = cabang,
        idKelamin = idKelamin,
        idCabang = idCabang;
  final int idCabang;
  final int idKelamin;
  final String cabang;

  @override
  State<HasilLombaPeserta> createState() => _HasilLombaPesertaState();
}

class _HasilLombaPesertaState extends State<HasilLombaPeserta> {
  Dio dio = Dio();
  List<Map<String, dynamic>> listPeserta = [];

  Future<void> fetchData() async {
    try {
      Response response = await dio
          .get('$ApiUrl/hasil/peserta/${widget.idCabang}/${widget.idKelamin}');
      if (response.statusCode == 200) {
        setState(() {
          listPeserta = List<Map<String, dynamic>>.from(response.data);
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
            '${widget.cabang} ${widget.idKelamin == 1 ? 'Putra' : 'Putri'}',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )),
      Expanded(
        child: Center(
          child: listPeserta.length <= 0
              ? Text('Belum Ada Data')
              : ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) => Card(
                      color: Colors.white,
                      child: InkWell(
                        highlightColor: Colors.white,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  opacity: 0.2,
                                  alignment: Alignment.bottomRight,
                                  fit: BoxFit.fitHeight,
                                  image: Image.asset(
                                          'assets/images/motif/motif_lapik_bottom_right.png')
                                      .image)),
                          child: Row(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: CachedNetworkImageProvider(
                                            '$ApiUrl/assets/images/profil/${listPeserta[index]['foto']}'))),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listPeserta[index]['nama'],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${listPeserta[index]['nilai']} Poin',
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      '${listPeserta[index]['kabupaten']}',
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            '$ApiUrl/assets/images/logo/kabupaten/${listPeserta[index]['logo']}'))),
                              ),
                            ],
                          ),
                        ),
                      )),
                  itemCount: listPeserta.length),
        ),
      )
    ]);
  }
}
