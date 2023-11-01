import 'package:flutter/material.dart';
import 'package:mtq_app/config/value.dart';

class InfoMarkerPemondokan extends StatelessWidget {
  const InfoMarkerPemondokan({super.key, required data}) : _data = data;
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
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(15))),
        height: 400,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 25,
              width: double.infinity,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: 10,
                  width: 80,
                ),
              ),
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/logo/kabupaten/${_data['icon']}',
                          height: 80,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pemondokan Putra & Putri',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Kabupaten ${_data['kabupaten']}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                '${_data['alamat']}',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Pemilik : ${_data['pemilik']}',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      makeCall('${_data['hp']}');
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${_data['hp']}',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      openDirection(_data['lat'], _data['long']);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.directions,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Petunjuk Arah',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
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
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(100), blurRadius: 5)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                                  'assets/images/pemondokan/${_data['imgUrl']}')
                              .image)),
                ),
              ),
            ),
          ],
        ));
  }
}