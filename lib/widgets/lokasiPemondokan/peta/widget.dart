import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mtq_app/models/dataLokasiPemondokan.dart';
import 'package:mtq_app/widgets/lokasiPemondokan/peta/infoMarker.dart';

class PetaLokasiPemondokan extends StatefulWidget {
  const PetaLokasiPemondokan({super.key});

  @override
  State<PetaLokasiPemondokan> createState() => _PetaLokasiPemondokanState();
}

class _PetaLokasiPemondokanState extends State<PetaLokasiPemondokan> {
  int selectedKab = 0;
  List<Map> selectedData = listLokasiPemondokan;

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
                    markers: selectedData
                        .skipWhile((e) => e['kabupaten'] == 'Semua Kabupaten')
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
                                        InfoMarkerPemondokan(
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
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100)),
                                          ),
                                          height: 35,
                                          width: 35,
                                          child: Image.asset(
                                            'assets/images/logo/kabupaten/${e['icon']}',
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            )))
                        .toList()),
              ],
            )),
        Positioned(
          top: 10,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10)
              ],
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(10)),
              color: Colors.white,
            ),
            child: DropdownButton(
              value: selectedKab,
              items: listLokasiPemondokan
                  .asMap()
                  .entries
                  .map((e) => DropdownMenuItem(
                      value: e.key,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                                'assets/images/logo/kabupaten/${e.value['icon']}'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(e.value['kabupaten']),
                        ],
                      )))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedKab = value!;
                  selectedData = value == 0
                      ? listLokasiPemondokan
                      : listLokasiPemondokan
                          .where((e) =>
                              e['kabupaten'] ==
                              listLokasiPemondokan[value]['kabupaten'])
                          .toList();
                });
              },
            ),
          ),
        ),
      ],
    ).animate(delay: const Duration(milliseconds: 500)).fade();
  }
}
