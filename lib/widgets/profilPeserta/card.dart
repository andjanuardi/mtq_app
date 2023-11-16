import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/widgets/home/imageLoader.dart';

class btnCardProfilPeserta extends StatelessWidget {
  const btnCardProfilPeserta(
      {super.key,
      required String nama,
      required String cabang,
      required String golongan,
      required String tglLahir,
      required String kelamin,
      required String image,
      required String noPeserta})
      : _nama = nama,
        _cabang = cabang,
        _golongan = golongan,
        _image = image,
        _kelamin = kelamin,
        _noPeserta = noPeserta,
        _tglLahir = tglLahir;

  final String _nama;
  final String _cabang;
  final String _golongan;
  final String _image;
  final String _kelamin;
  final String _tglLahir;
  final String _noPeserta;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: Colors.white,
        elevation: 4,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
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
                height: 120,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                  '$ApiUrl/assets/images/profil/$_image')),
                          color: Theme.of(context).primaryColor.withAlpha(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withAlpha(100),
                                blurRadius: 10)
                          ]),
                      width: 100,
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
                                Icons.credit_card_sharp,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                _noPeserta,
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
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
                                _kelamin,
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.bookmark_outlined,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "$_cabang $_golongan",
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                _tglLahir,
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
        ),
      ),
    );
  }
}
