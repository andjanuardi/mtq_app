// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfilKabupaten extends StatelessWidget {
  const ProfilKabupaten({super.key});

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
                onPressed: () {},
                icon: Icon(
                  Icons.photo,
                  size: 24,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'PROFIL KABUPATEN',
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
        child: Center(
          child: Text(
            'Belum ada data',
            style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Theme.of(context).primaryColor),
          ),
        ),
        // child: ListView.builder(
        //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //   itemCount: 7,
        //   itemBuilder: (context, index) => const CardJadwal(),
        // ),
      )
    ]);
  }
}
