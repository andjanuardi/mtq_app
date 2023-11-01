import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/widgets/home/menuInformasi/card.dart';
import 'package:mtq_app/widgets/home/menuInformasi/config.dart';

class MenuInformasi extends StatelessWidget {
  const MenuInformasi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Informasi',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).primaryColor),
              )),
          Container(
            width: double.infinity,
            child: Wrap(
                spacing: 10,
                runSpacing: 15,
                alignment: WrapAlignment.spaceAround,
                children: ListMenuInformasi.map((e) => CardInformasi(
                        text: e['label'],
                        imageUrl: e['imageUrl'],
                        url: e['url'],
                        icon: e['icon']))
                    .toList()
                    .animate(interval: 100.ms)
                    .fade(begin: 0.5)
                    .slideY(begin: -0.3)),
          ),
        ],
      ),
    );
  }
}
