import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/main.dart';
import 'package:mtq_app/screens/profilPeserta.dart';

class btnCardProvinsi extends StatelessWidget {
  const btnCardProvinsi({
    super.key,
    required int id,
    required String nama,
    required String ibuKota,
    required String bupati,
    required String logo,
  })  : _nama = nama,
        _id = id,
        _ibuKota = ibuKota,
        _bupati = bupati,
        _logo = logo;

  final int _id;
  final String _nama;
  final String _ibuKota;
  final String _bupati;
  final String _logo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                      builder: (BuildContext context) => LayoutApp(
                          child: SafeArea(
                              child: DaftarPeserta(
                                  kabupaten: _nama, id_kabupaten: _id)))));
            },
            child: Ink(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.bottomRight,
                      image: Image.asset(
                              'assets/images/motif/motif_lapik_bottom_right.png')
                          .image)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 20,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            repeat: ImageRepeat.repeatX,
                            image: Image.asset(
                                    'assets/images/motif/motif_lapik2_horizontal.png')
                                .image)),
                  ),
                  SizedBox(
                    height: 95,
                    child: Row(
                      children: [
                        Container(
                          height: double.infinity,
                          width: 100,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              color:
                                  Theme.of(context).primaryColor.withAlpha(50),
                              image: DecorationImage(
                                  scale: 1.2,
                                  image: CachedNetworkImageProvider(
                                      '$ApiUrl/assets/images/logo/kabupaten/$_logo'))),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_nama,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.home,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    _ibuKota,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.person,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    _bupati,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
