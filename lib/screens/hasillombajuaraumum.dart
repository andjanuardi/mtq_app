// import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mtq_app/config/value.dart';

class HasilLombaJuaraUmum extends StatefulWidget {
  const HasilLombaJuaraUmum({super.key});

  @override
  State<HasilLombaJuaraUmum> createState() => _HasilLombaJuaraUmumState();
}

class _HasilLombaJuaraUmumState extends State<HasilLombaJuaraUmum> {
  Dio dio = Dio();
  List<Map<String, dynamic>> listKabupaten = [];

  Future<void> fetchData() async {
    try {
      Response response = await dio.get('$ApiUrl/kabupaten');
      if (response.statusCode == 200) {
        setState(() {
          listKabupaten = List<Map<String, dynamic>>.from(response.data);
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
          child: const Text(
            'JUARA UMUM',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )),
      Expanded(
        child: Center(
          child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) => Card(
                  color: index == 0
                      ? Colors.yellow[800]
                      : index == 1
                          ? Colors.green[300]
                          : index == 2
                              ? Colors.brown[200]
                              : index <= 5
                                  ? Colors.white70
                                  : Colors.white,
                  child: InkWell(
                    onTap: () {},
                    highlightColor: Colors.white,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              opacity: 0.2,
                              alignment: Alignment.bottomLeft,
                              fit: BoxFit.fitHeight,
                              image: Image.asset(
                                      'assets/images/motif/motif_lapik2_bottom_left.png')
                                  .image)),
                      child: Row(
                        children: [
                          if (index <= 5)
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.white.withAlpha(200),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Text(
                                    index == 0
                                        ? '1'
                                        : index == 1
                                            ? '2'
                                            : index == 2
                                                ? '3'
                                                : "",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(
                                    fill: 1,
                                    Symbols.editor_choice,
                                  ),
                                ],
                              ),
                            ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        '$ApiUrl/assets/images/logo/kabupaten/${listKabupaten[index]['logo']}'))),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listKabupaten[index]['nama'],
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  index == 0
                                      ? 'Juara I (10 Medali)'
                                      : index == 1
                                          ? 'Juara II (10 Medali)'
                                          : index == 2
                                              ? 'Juara III (10 Medali)'
                                              : index == 3
                                                  ? 'Juara Harapan I (10 Medali)'
                                                  : index == 4
                                                      ? 'Juara Harapan II (10 Medali)'
                                                      : index == 5
                                                          ? 'Juara Harapan III (10 Medali)'
                                                          : "10 Medali",
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              itemCount: listKabupaten.length),
        ),
      )
    ]);
  }
}
