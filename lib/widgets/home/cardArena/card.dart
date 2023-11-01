import 'package:flutter/material.dart';

class btnCardLomba extends StatelessWidget {
  const btnCardLomba({
    super.key,
    required String arena,
    required String lokasi,
    required String alamat,
    required String cabang,
    required String imageUrl,
  })  : _arena = arena,
        _lokasi = lokasi,
        _alamat = alamat,
        _cabang = cabang,
        _imageUrl = imageUrl;

  final String _arena;
  final String _lokasi;
  final String _alamat;
  final String _cabang;
  final String _imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 330,
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: Colors.white,
        elevation: 4,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: InkWell(
            onTap: () {},
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Container(
                      alignment: Alignment(-1, -1),
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
                                _arena,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Theme.of(context).primaryColor),
                              ),
                              Text(_lokasi,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54)),
                              Text(_alamat,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment(1, 0),
                          child: Container(
                            width: 100,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(),
                            child: Image.asset(
                              _imageUrl,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ],
                  ),
                  Align(
                    alignment: Alignment(0, 1),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      width: double.infinity,
                      color: Theme.of(context).primaryColor.withAlpha(200),
                      child: Text(_cabang,
                          style: TextStyle(
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
