import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/models/dataArena.dart';
import 'package:mtq_app/widgets/daftarArena/card.dart';

class CardArena extends StatefulWidget {
  const CardArena({
    super.key,
  });

  @override
  State<CardArena> createState() => _CardArenaState();
}

class _CardArenaState extends State<CardArena> {
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Arena Lomba',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).primaryColor),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/daftararena');
                },
                child: Container(
                    // height: 30,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: const Text('Selengkapnya')),
              )
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          // padding: EdgeInsets.symmetric(horizontal: 20),
          height: 190,

          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Wrap(
                  direction: Axis.horizontal,
                  spacing: 20,
                  children: [
                    const SizedBox(),
                    ...listArena
                        .map((e) => btnCardArena(
                              data: e,
                            ))
                        .toList(),
                    const SizedBox(),
                  ]
                      .animate(interval: 100.ms)
                      .fade(begin: 0.5)
                      .slideX(begin: -0.3)),
            ],
          ),
        ),
      ],
    );
  }
}
