import 'package:flutter/material.dart';
import 'package:mtq_app/config/value.dart';

class btnCardNomorPenting extends StatelessWidget {
  const btnCardNomorPenting({
    super.key,
    required String nama,
    required String keterangan,
    required String tlpn,
  })  : _nama = nama,
        _keterangan = keterangan,
        _tlpn = tlpn;

  final String _nama;
  final String _keterangan;
  final String _tlpn;

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
              makeCall(_tlpn);
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    width: double.infinity,
                    color: Theme.of(context).primaryColor.withAlpha(200),
                    child: Text(_keterangan,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 80,
                    child: Row(
                      children: [
                        Container(
                          height: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          color: Theme.of(context).primaryColor,
                          child: const Icon(
                            Icons.phone,
                            size: 40,
                            color: Colors.white,
                          ),
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
                                  Text(
                                    _tlpn,
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
