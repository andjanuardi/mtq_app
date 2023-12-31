import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/main.dart';
import 'package:mtq_app/screens/detailarena.dart';

class InfoMarkerArena extends StatelessWidget {
  const InfoMarkerArena({super.key, required data}) : _data = data;
  final Map _data;
  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 5)
            ],
            image: DecorationImage(
                opacity: 0.2,
                alignment: Alignment.bottomRight,
                fit: BoxFit.fitWidth,
                image: Image.asset(
                  'assets/images/motif/motif_lapik_bottom_right.png',
                ).image),
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(15))),
        height: 400,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 25,
              width: double.infinity,
              child: Center(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: 10,
                  width: 80,
                ),
              ),
            ),
            Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${_data['nama']}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      '${_data['lokasi']}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      '${_data['alamat']}',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      '${_data['cabang']}',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LayoutApp(child: DetailArena(data: _data))));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.open_in_new,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Detail',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      openDirection(double.parse(_data['lat']),
                          double.parse(_data['long']));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.directions,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Petunjuk Arah',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.7,
                      repeat: ImageRepeat.repeatX,
                      image: Image.asset(
                              'assets/images/motif/motif_lapik2_horizontal.png')
                          .image)),
              height: 25,
              width: double.infinity,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Container(
                    decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 5)
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: _data['gambar'] == null
                          ? Image.asset('assets/images/card/default.jpg').image
                          : CachedNetworkImageProvider(
                              '${ApiUrl}/assets/images/arena/${_data['gambar']}')),
                )),
              ),
            ),
          ],
        ));
  }
}
