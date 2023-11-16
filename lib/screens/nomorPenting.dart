// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/models/dataNomorPenting.dart';
import 'package:mtq_app/widgets/nomorPenting/card.dart';
import 'package:mtq_app/config/value.dart';

class NomorPenting extends StatefulWidget {
  const NomorPenting({super.key});

  @override
  State<NomorPenting> createState() => _NomorPentingState();
}

class _NomorPentingState extends State<NomorPenting> {
  Dio dio = Dio();
  List<Map<String, dynamic>> listNomor = [];

  Future<void> fetchData() async {
    try {
      Response response = await dio.get('$ApiUrl/telp');
      if (response.statusCode == 200) {
        setState(() {
          listNomor = List<Map<String, dynamic>>.from(response.data);
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
                'DAFTAR NOMOR PENTING',
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
          itemCount: listNomor.length,
          itemBuilder: (context, index) => btnCardNomorPenting(
              nama: listNomor[index]['nama'],
              keterangan: listNomor[index]['keterangan'],
              tlpn: listNomor[index]['telp']),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
        ),
      ))
    ]);
  }
}
