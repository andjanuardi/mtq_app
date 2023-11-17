// import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/models/dataArena.dart';
import 'package:mtq_app/widgets/daftarArena/card.dart';

class DaftarArena extends StatefulWidget {
  const DaftarArena({super.key});

  @override
  State<DaftarArena> createState() => _DaftarArenaState();
}

class _DaftarArenaState extends State<DaftarArena> {
  Dio dio = Dio();
  List<Map<String, dynamic>> listArena = [];

  Future<void> fetchData() async {
    try {
      Response response = await dio.get('$ApiUrl/lokasiarena');
      if (response.statusCode == 200) {
        setState(() {
          listArena = List<Map<String, dynamic>>.from(response.data);
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
                'DAFTAR ARENA',
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
          child: SizedBox(
        width: double.infinity,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemCount: listArena.length,
          itemBuilder: (context, index) => btnCardArena(
            data: listArena[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
        ),
      ))
    ]);
  }
}
