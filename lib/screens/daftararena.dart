// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/models/dataArena.dart';
import 'package:mtq_app/widgets/daftarArena/card.dart';

class DaftarArena extends StatelessWidget {
  const DaftarArena({super.key});

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
              alignment: AlignmentDirectional(1.00, 1.00),
              image: Image.asset(
                'assets/images/motif/motif_lapik2_top_right.png',
              ).image,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
              SizedBox(width: 10),
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
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemCount: dataArena.length,
          itemBuilder: (context, index) => btnCardArena(
            arena: dataArena[index]['arena'],
            lokasi: dataArena[index]['lokasi'],
            alamat: dataArena[index]['alamat'],
            cabang: dataArena[index]['cabang'],
            imageUrl: dataArena[index]['image'],
            lat: dataArena[index]['lat'],
            long: dataArena[index]['long'],
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),
        ),
      ))
    ]);
  }
}
