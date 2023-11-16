// import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/widgets/profilPeserta/card.dart';
import 'package:mtq_app/widgets/profilPeserta/cardProvinsi.dart';

class ProfilPeserta extends StatefulWidget {
  const ProfilPeserta({super.key});

  @override
  State<ProfilPeserta> createState() => _ProfilPesertaState();
}

class _ProfilPesertaState extends State<ProfilPeserta> {
  Dio dio = Dio();
  List<Map<String, dynamic>> kabupatenData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      Response response = await dio.get('$ApiUrl/kabupaten');
      if (response.statusCode == 200) {
        setState(() {
          kabupatenData = List<Map<String, dynamic>>.from(response.data);
        });
      } else {
        // Handle errors
        print('Failed to load data');
      }
    } catch (e) {
      print('Error ini: $e');
    }
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
                'PROFIL PESERTA',
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
          padding: EdgeInsets.all(10),
          itemCount: kabupatenData.length,
          itemBuilder: (context, index) {
            return btnCardProvinsi(
                id: int.parse(kabupatenData[index]['id']),
                nama: kabupatenData[index]['nama'],
                ibuKota: kabupatenData[index]['ibu_kota'],
                bupati: kabupatenData[index]['pimpinan'],
                logo: kabupatenData[index]['logo']);
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
        ),
      ))
    ]);
  }
}

class DaftarPeserta extends StatefulWidget {
  const DaftarPeserta({super.key, required kabupaten, required id_kabupaten})
      : _id_kabupaten = id_kabupaten,
        _kabupaten = kabupaten;
  final int _id_kabupaten;
  final String _kabupaten;

  @override
  State<DaftarPeserta> createState() => _DaftarPesertaState();
}

class _DaftarPesertaState extends State<DaftarPeserta> {
  Dio dio = Dio();
  List<Map<String, dynamic>> selectedPeserta = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      Response response =
          await dio.get('$ApiUrl/peserta/kab/${widget._id_kabupaten}');
      if (response.statusCode == 200) {
        setState(() {
          selectedPeserta = List<Map<String, dynamic>>.from(response.data);
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
                'PROFIL PESERTA',
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
        width: double.infinity,
        color: Theme.of(context).primaryColor.withAlpha(200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text(
          widget._kabupaten.toUpperCase(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      if (selectedPeserta.length <= 0)
        Expanded(
          child: Center(
            child: Text(
              'Belum ada data',
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      if (selectedPeserta.length > 0)
        Expanded(
            child: SizedBox(
          width: double.infinity,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemCount: selectedPeserta.length,
            itemBuilder: (context, index) => btnCardProfilPeserta(
              noPeserta: selectedPeserta[index]['no'],
              nama: selectedPeserta[index]['nama'],
              cabang: selectedPeserta[index]['cabang'],
              golongan: selectedPeserta[index]['golongan'],
              tglLahir: selectedPeserta[index]['lahir'],
              kelamin: selectedPeserta[index]['kelamin'],
              image: selectedPeserta[index]['foto'],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
          ),
        ))
    ]);
  }
}
