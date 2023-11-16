import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mtq_app/config/value.dart';

class ImgViewer extends StatelessWidget {
  final Map data;
  final bool slider;
  const ImgViewer({super.key, required data, required slider})
      : data = data,
        slider = slider;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          color: Colors.black.withAlpha(200),
          child: Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              Flexible(
                child: Text(
                  '${data['nama']}',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(100),
              ),
              child: InteractiveViewer(
                  boundaryMargin: EdgeInsets.all(20.0),
                  minScale: 0.1,
                  maxScale: 4,
                  child: CachedNetworkImage(
                      imageUrl: slider
                          ? '${ApiUrl}/assets/images/slider/${data['gambar']}'
                          : '${ApiUrl}/assets/images/galeri/${data['gambar']}'))),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Colors.black.withAlpha(200),
          child: Column(
            children: [
              Text(
                '${data['nama']}',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${data['keterangan']}',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
