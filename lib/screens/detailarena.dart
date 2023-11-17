// import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/config/value.dart';

class DetailArena extends StatefulWidget {
  const DetailArena({super.key, required data}) : data = data;

  final Map data;

  @override
  State<DetailArena> createState() => _DetailArenaState();
}

class _DetailArenaState extends State<DetailArena> {
  Dio dio = Dio();
  List<Map<String, dynamic>> listPeserta = [];

  Future<void> fetchData() async {
    try {
      Response response =
          await dio.get('$ApiUrl/hasil/arena/${widget.data['id']}');
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
                'Detail ${widget.data['nama']}',
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
        padding: EdgeInsets.all(10),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                    '${ApiUrl}/assets/images/arena/${widget.data['gambar']}'))),
      ),
      Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withAlpha(220),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data['lokasi'],
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              widget.data['alamat'],
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.data['cabang'],
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
      Expanded(
        child: Center(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemCount: listPeserta.length,
            itemBuilder: (context, index) => Card(
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.bottomRight,
                        image: Image.asset(
                                'assets/images/motif/motif_lapik_bottom_right.png')
                            .image)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: CachedNetworkImageProvider(
                                            '${ApiUrl}/assets/images/profil/${listPeserta[index]['foto']}'))),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listPeserta[index]['nama'],
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      listPeserta[index]['kabupaten'],
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      listPeserta[index]['no'],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: CachedNetworkImageProvider(
                                            '${ApiUrl}/assets/images/logo/kabupaten/${listPeserta[index]['logo']}'))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.bookmark),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                listPeserta[index]['cabang'] ==
                                        listPeserta[index]['golongan']
                                    ? "${listPeserta[index]['cabang']} ${listPeserta[index]['kelamin'] == 1 ? "Putra" : "Putri"}"
                                    : "${listPeserta[index]['cabang']} ${listPeserta[index]['golongan']} ${int.parse(listPeserta[index]['kelamin']) == 1 ? "Putra" : "Putri"}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
