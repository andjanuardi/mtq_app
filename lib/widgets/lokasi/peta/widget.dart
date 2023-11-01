import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mtq_app/models/dataLokasi.dart';
import 'package:mtq_app/widgets/lokasi/peta/infoMarker.dart';

class PetaLokasi extends StatelessWidget {
  const PetaLokasi({super.key, required title}) : _title = title;

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            child: FlutterMap(
              options: const MapOptions(
                interactionOptions: InteractionOptions(
                  flags: ~InteractiveFlag.rotate,
                ),
                initialCenter: LatLng(2.456148, 96.380469),
                initialZoom: 14,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'http://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                ),
                MarkerLayer(
                    markers: dataLokasi
                        .where((e) => e['jenis'] == _title)
                        .map((e) => Marker(
                            alignment: Alignment.topCenter,
                            height: 65,
                            width: 65,
                            point: LatLng(e['lat'], e['long']),
                            child: InkWell(
                              onTap: () {
                                showBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (BuildContext context) =>
                                        // Text(e.toString()));
                                        InfoMarker(
                                          data: e,
                                        ));
                              },
                              child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 85,
                                        width: 85,
                                        child: Image.asset(
                                            'assets/images/icons/location-pin.png'),
                                      ),
                                      Positioned(
                                        left: 15,
                                        top: 5,
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset(
                                                  '${e['image']}',
                                                ).image),
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100)),
                                          ),
                                          height: 35,
                                          width: 35,
                                        ),
                                      ),
                                    ],
                                  )),
                            )))
                        .toList()),
              ],
            )),
      ],
    ).animate(delay: const Duration(milliseconds: 500)).fade();
  }
}
