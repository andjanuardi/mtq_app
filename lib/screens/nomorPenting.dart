// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/models/dataNomorPenting.dart';
import 'package:mtq_app/widgets/nomorPenting/card.dart';

class NomorPenting extends StatelessWidget {
  const NomorPenting({super.key});

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
          itemCount: dataNomorPenting.length,
          itemBuilder: (context, index) => btnCardNomorPenting(
              nama: dataNomorPenting[index]['nama'],
              keterangan: dataNomorPenting[index]['keterangan'],
              tlpn: dataNomorPenting[index]['tlpn']),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
        ),
      ))
    ]);
  }
}
