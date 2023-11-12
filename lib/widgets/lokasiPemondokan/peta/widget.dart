import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mtq_app/widgets/bottomNav/config.dart';
import 'package:mtq_app/widgets/lokasiPemondokan/peta/infoMarker.dart';

class PetaLokasiPemondokan extends StatefulWidget {
  const PetaLokasiPemondokan({super.key});

  @override
  State<PetaLokasiPemondokan> createState() => _PetaLokasiPemondokanState();
}

class _PetaLokasiPemondokanState extends State<PetaLokasiPemondokan> {
  int selectedKab = 0;
  List<Map<String, dynamic>> selectedData = [];

  Dio dio = Dio();
  List<Map<String, dynamic>> listKabupaten = [];
  List<Map<String, dynamic>> listLokasiPemondokan = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      Response response = await dio.get('$ApiUrl/kabupaten');
      if (response.statusCode == 200) {
        setState(() {
          listKabupaten = List<Map<String, dynamic>>.from(response.data);
        });
      } else {
        // Handle errors
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
    try {
      Response response = await dio.get('$ApiUrl/lokasipemondokan');
      if (response.statusCode == 200) {
        setState(() {
          selectedData = List<Map<String, dynamic>>.from(response.data);
          listLokasiPemondokan = List<Map<String, dynamic>>.from(response.data);
        });
      } else {
        // Handle errors
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

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
                        .map((e) => Marker(
                            alignment: Alignment.topCenter,
                            height: 65,
                            width: 65,
                            point: LatLng(double.parse(e['lat']),
                                double.parse(e['long'])),
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
                              child: SizedBox(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        height: 85,
                                        width: 85,
                                        child: Image.asset(
                                            'assets/images/icons/location-pin.png'),
                                      ),
                                      Positioned(
                                        left: 15,
                                        top: 5,
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100)),
                                          ),
                                          height: 35,
                                          width: 35,
                                          child: Image.asset(
                                            'assets/images/logo/kabupaten/${e['logo']}',
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
              items: [
                DropdownMenuItem(
                    value: 0,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: Image.asset(
                              'assets/images/logo/kabupaten/logo.png'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Semua Kabupaten'),
                      ],
                    )),
                ...listKabupaten
                    .asMap()
                    .entries
                    .map((e) => DropdownMenuItem(
                        value: int.parse(e.value['id']),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: Image.asset(
                                  'assets/images/logo/kabupaten/${e.value['logo']}'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(e.value['nama']),
                          ],
                        )))
                    .toList()
              ],
              onChanged: (value) {
                setState(() {
                  selectedKab = value!;
                  selectedData = value == 0
                      ? listLokasiPemondokan
                      : listLokasiPemondokan
                          .where((e) => int.parse(e['id_kabupaten']) == value)
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
