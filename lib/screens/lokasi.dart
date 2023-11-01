// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/widgets/lokasi/peta/widget.dart';

class Lokasi extends StatelessWidget {
  const Lokasi({super.key, required title}) : _title = title;
  final String _title;

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
                'LOKASI ${_title.toUpperCase()}',
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
          child: PetaLokasi(
        title: _title,
      ))
    ]);
  }
}
