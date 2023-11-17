import 'package:flutter/material.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/main.dart';
import 'package:mtq_app/screens/detailarena.dart';
import 'package:mtq_app/widgets/home/imageLoader.dart';

class btnCardArena extends StatelessWidget {
  const btnCardArena({super.key, required data}) : data = data;

  final Map data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 320,
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: Colors.white,
        elevation: 4,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LayoutApp(
                        child: SafeArea(
                            child: DetailArena(
                      data: data,
                    ))),
                  ));
            },
            highlightColor: Colors.white,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Container(
                      alignment: const Alignment(-1, -1),
                      child: Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          'assets/images/motif/motif_lapik_top_left.png',
                        ),
                      )),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['nama'],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Theme.of(context).primaryColor),
                              ),
                              Text(data['lokasi'],
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54)),
                              Text(data['alamat'],
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54)),
                              SizedBox(
                                height: 10,
                              ),
                              Material(
                                child: InkWell(
                                  onTap: () {
                                    openDirection(double.parse(data['lat']),
                                        double.parse(data['long']));
                                  },
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    width: 150,
                                    height: 30,
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.directions,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Petunjuk Arah',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          alignment: const Alignment(1, 0),
                          child: Container(
                            width: 100,
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(),
                            child: ImageLoader(
                              url:
                                  '${ApiUrl}/assets/images/arena/${data['gambar']}',
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ],
                  ),
                  Align(
                    alignment: const Alignment(0, 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      width: double.infinity,
                      color: Theme.of(context).primaryColor.withAlpha(200),
                      child: Text(data['cabang'],
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
