// import 'dart:html';

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/main.dart';
import 'package:mtq_app/screens/detailarena.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScan extends StatefulWidget {
  const QRScan({super.key});

  @override
  State<QRScan> createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  Dio dio = Dio();
  List<Map<String, dynamic>> listArena = [];

  Future<void> fetchData() async {
    try {
      Response response = await dio.get('$ApiUrl/lokasiarena');
      if (response.statusCode == 200) {
        setState(() {
          listArena = List<Map<String, dynamic>>.from(response.data);
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
  void initState() {
    fetchData(); // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
                'Pemindai QR Code',
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
        child: Center(
          child: QRScannerWidget(
            data: listArena,
          ),
          // child: Text(
          //   'Belum ada data',
          //   style: TextStyle(
          //       fontSize: 20,
          //       fontStyle: FontStyle.italic,
          //       color: Theme.of(context).primaryColor),
          // ),
        ),
        // child: ListView.builder(
        //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //   itemCount: 7,
        //   itemBuilder: (context, index) => const CardJadwal(),
        // ),
      )
    ]);
  }
}

class QRScannerWidget extends StatefulWidget {
  const QRScannerWidget({super.key, required data}) : data = data;

  final List data;
  // const QRScannerWidget({Key? key, required List<Map<String, dynamic>>? data})
  // : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRScannerWidgetState();
}

class _QRScannerWidgetState extends State<QRScannerWidget> {
  Barcode? result;

  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  // Dio dio = Dio();

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(child: _buildQrView(context)),
          Container(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 120,
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                      onTap: () async {
                        await controller?.toggleFlash();
                        setState(() {});
                      },
                      child: FutureBuilder(
                        future: controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          return snapshot.data == true
                              ? const Icon(
                                  Icons.flashlight_on,
                                  color: Colors.white,
                                )
                              : const Icon(Icons.flashlight_off,
                                  color: Colors.white);
                          // return Text(
                          //     'Lampu: ${snapshot.data == true ? 'Hidup' : 'Mati'}');
                        },
                      )),
                  InkWell(
                      onTap: () async {
                        await controller?.flipCamera();
                        setState(() {});
                      },
                      child: FutureBuilder(
                        future: controller?.getCameraInfo(),
                        builder: (context, snapshot) {
                          if (snapshot.data != null) {
                            return snapshot.data! == 'back'
                                ? const Icon(Icons.camera_rear,
                                    color: Colors.white)
                                : const Icon(Icons.camera, color: Colors.white);
                            // return Text(
                            //     '${describeEnum(snapshot.data!) == 'back' ? 'Kamera Belakang' : 'Kamera Depan'}');
                          } else {
                            return const Text('Memuat..');
                          }
                        },
                      )),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              height: 100,
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                'Silahkan scan QR Code yang ada di arena perlombaan',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 250.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Theme.of(context).primaryColor,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          overlayColor: Colors.black.withAlpha(200),
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });

      if (result != null) {
        List<String> qrdata = scanData!.code.toString().split(':');
        if (qrdata[0] == "MTQACEHXXXVI2023SIMEULUE" && widget.data.length > 0) {
          controller.pauseCamera();
          openPageDetail(context, widget.data, qrdata[1]);
        }

        //openLink(result!.code.toString());
      }
      // Text(
      //     'Tipe Barcode: ${describeEnum(result!.format)}   Data: ${result!.code}')
      else {}
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
