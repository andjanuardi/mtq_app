import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/widgets/lokasi/peta/infoMarker.dart';

class PetaLokasi extends StatefulWidget {
  const PetaLokasi({super.key, required title, required id})
      : _title = title,
        _id = id;
  final int _id;
  final String _title;

  @override
  State<PetaLokasi> createState() => _PetaLokasiState();
}

class _PetaLokasiState extends State<PetaLokasi> {
  Dio dio = Dio();
  List<Map<String, dynamic>> listLokasi = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      Response response = await dio.get('$ApiUrl/lokasi/jenis/${widget._id}');
      if (response.statusCode == 200) {
        setState(() {
          listLokasi = List<Map<String, dynamic>>.from(response.data);
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
                initialZoom: 12,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'http://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                ),
                MarkerLayer(markers: [
                  ...listLokasi
                      .map((e) => Marker(
                          alignment: Alignment.topCenter,
                          height: 65,
                          width: 65,
                          point: LatLng(
                              double.parse(e['lat']), double.parse(e['long'])),
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
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              scale: e['image'] == null ? 4 : 1,
                                              fit: e['image'] == null
                                                  ? BoxFit.none
                                                  : BoxFit.cover,
                                              image: e['image'] == null
                                                  ? Image.asset(
                                                      'assets/images/icons/${e['ikon']}',
                                                    ).image
                                                  : CachedNetworkImageProvider(
                                                      '$ApiUrl/assets/images/lokasi/${e['image']}',
                                                    )),
                                          color: Colors.red[600],
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(100)),
                                        ),
                                        height: 35,
                                        width: 35,
                                      ),
                                    ),
                                  ],
                                )),
                          )))
                      .toList()
                ]),
              ],
            )),
      ],
    ).animate(delay: const Duration(milliseconds: 500)).fade();
  }
}

class MyCoor extends StatefulWidget {
  const MyCoor({super.key});

  @override
  State<MyCoor> createState() => _MyCoorState();
}

class _MyCoorState extends State<MyCoor> {
  late Future<Position> pos =
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  @override
  Widget build(BuildContext context) {
    return Text(pos.toString());
  }
}
