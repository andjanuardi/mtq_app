// import 'dart:html';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Kiblat extends StatefulWidget {
  const Kiblat({super.key});

  @override
  State<Kiblat> createState() => _KiblatState();
}

class _KiblatState extends State<Kiblat> {
  bool _hasPermissions = false;
  CompassEvent? _lastRead;
  DateTime? _lastReadAt;
  double kiblatHead = 0;
  String lokasi = '';

  Future<void> getKiblat() async {
    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    double bearing = Geolocator.bearingBetween(
      pos.latitude,
      pos.longitude,
      21.4224779,
      39.8262775,
    );

    // if (bearing > 0) {
    if (mounted) {
      setState(() {
        kiblatHead = 360 + bearing;
      });
    }
    // }
  }

  @override
  void initState() {
    super.initState();
    _fetchPermissionStatus();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (mounted && _hasPermissions) {
      getKiblat();
    }
    return Builder(builder: (context) {
      if (_hasPermissions) {
        return Column(
          children: <Widget>[
            Material(
              color: Colors.transparent,
              elevation: 2,
              child: Container(
                width: double.infinity,
                height: 57,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    opacity: 0.7,
                    fit: BoxFit.fitHeight,
                    alignment: const AlignmentDirectional(1.00, 1.00),
                    image: Image.asset(
                      'assets/images/motif/motif_lapik2_top_right.png',
                    ).image,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(mainAxisSize: MainAxisSize.max, children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'ARAH KIBLAT',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ]),
                ),
              ),
            ).animate().fade().slide(),
            Expanded(
                child: kiblatHead == 0
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sedang Mencari Arah Kiblat',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ))
                    : _buildCompass()),
          ],
        );
      } else {
        return _buildPermissionSheet();
      }
    });
  }

  Widget _buildCompass() {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Kesalahan membaca arah: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        double? direction = snapshot.data!.heading;
        // double? direction = 294.70;

        // if direction is null, then device does not support this sensor
        // show error message
        if (direction == null)
          return Center(
            child: Text("Maaf Sensor tidak tersedia"),
          );

        return Material(
          shape: CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Transform.rotate(
              angle: (direction * (math.pi / 180) * -1) + kiblatHead,
              child: Image.asset('assets/images/card/kiblat.png'),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPermissionSheet() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Material(
          color: Colors.transparent,
          elevation: 2,
          child: Container(
            width: double.infinity,
            height: 57,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                opacity: 0.7,
                fit: BoxFit.fitHeight,
                alignment: const AlignmentDirectional(1.00, 1.00),
                image: Image.asset(
                  'assets/images/motif/motif_lapik2_top_right.png',
                ).image,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(mainAxisSize: MainAxisSize.max, children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'ARAH KIBLAT',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ]),
            ),
          ),
        ).animate().fade().slide(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Izin Lokasi dibutuhkan'),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Permission.locationWhenInUse.request().then((ignored) {
                    _fetchPermissionStatus();
                  });
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Theme.of(context).primaryColor,
                  ),
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Izinkan Lokasi',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () {
                  openAppSettings().then((opened) {
                    //
                  });
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Theme.of(context).primaryColor,
                  ),
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Buka Pengaturan',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _fetchPermissionStatus() {
    Permission.locationWhenInUse.status.then((status) {
      if (mounted) {
        setState(() => _hasPermissions = status == PermissionStatus.granted);
      }
    });
  }
}
