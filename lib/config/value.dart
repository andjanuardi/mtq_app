import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mtq_app/main.dart';
import 'package:mtq_app/screens/detailarena.dart';
import 'package:url_launcher/url_launcher.dart';

const double TabletWidth = 480;
const double WebWidth = 1080;

void openYoutube(String id) async {
  final Uri url = Uri(
      scheme: 'https',
      host: 'www.youtube.com',
      path: '/watch/',
      queryParameters: {'v': id});
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    print('paik');
  }
}

void openLink(String link) async {
  final Uri url = Uri.parse(link);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    print('paik');
  }
}

void openDirection(double lat, double long) async {
  final String coor = '$lat,$long';
  final Uri url = Uri(
      scheme: 'https',
      host: 'www.google.co.id',
      path: '/maps/dir/',
      queryParameters: {
        'api': '1',
        'destination': coor,
        'dir_action': 'navigate'
      });
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    print('paik');
  }
}

void makeCall(String tel) async {
  final Uri url = Uri(scheme: 'tel', path: tel);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    print('paik');
  }
}

Future<Position> getLocation() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  return position;
}

const String ApiUrl = 'https://andj.tech/api';

const bulan = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember',
];

const hari = [
  'Senin',
  'Selasa',
  'Rabu',
  'Kamis',
  'Jum\'at',
  'Sabtu',
  'Minggu',
];

String tanggalStr(value) {
  var date = DateTime.parse(value);
  return ("${hari[date.weekday - 1]}, ${date.day} ${bulan[date.month - 1]} ${date.year}");
}

List<Map<String, dynamic>> groupBy(
    List<Map<String, dynamic>> data, String key) {
  Map<String, List<Map<String, dynamic>>> groupedData = {};
  List<Map<String, dynamic>> returnData = [];

  for (var item in data) {
    String val = item[key].toString();
    if (!groupedData.containsKey(val)) {
      groupedData[val] = [item];
    }
  }

  groupedData.forEach((key, value) {
    returnData.addAll(value);
  });
  return returnData;
}

Future<void> openPageDetail(
    BuildContext context, List<dynamic> data, String id) async {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SafeArea(
            child: LayoutApp(
                child: DetailArena(
                    data: data.where((e) => e['id'] == id).toList()[0]))),
      ));
}

Future<void> showPopup(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(1),
        // title: const Text('Basic dialog title'),
        content: Image(
          // height: 100,
          // width: 100,
          image: CachedNetworkImageProvider(
              '${ApiUrl}/assets/images/ads/gogreen.jpg'),
        ),
        // actionsPadding: EdgeInsets.all(2),
        // actions: [
        //   Center(
        //     child: TextButton(
        //       style: TextButton.styleFrom(
        //         textStyle: Theme.of(context).textTheme.labelLarge,
        //       ),
        //       child: const Text('Lanjukan'),
        //       onPressed: () {
        //         Navigator.pushReplacementNamed(
        //             context, '/home', (route) => false);
        //       },
        //     ),
        //   ),
        // ],
      );
      // actions: <Widget>[
      //   TextButton(
      //     style: TextButton.styleFrom(
      //       textStyle: Theme.of(context).textTheme.labelLarge,
      //     ),
      //     child: const Text('Disable'),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      //   TextButton(
      //     style: TextButton.styleFrom(
      //       textStyle: Theme.of(context).textTheme.labelLarge,
      //     ),
      //     child: const Text('Enable'),
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      // ],
    },
  );
}

Future<void> belumBayar(BuildContext context) {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // title: const Text('Basic dialog title'),
        content: Text(
            'Mohon Maaf Aplikasi Ini tidak dapat digunakan di karenakan panitia pelaksana belum menyelesaikan pembayaran'),
        actionsPadding: EdgeInsets.all(2),
      );
    },
  );
}

Future<void> tidakadakoneksi(BuildContext context) {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // title: const Text('Basic dialog title'),
        content: Text(
            'Tidak dapat terhubung ke server silahkan cek koneksi internet'),
        actionsPadding: EdgeInsets.all(2),
      );
    },
  );
}

Future<void> versisalah(BuildContext context) {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // title: const Text('Basic dialog title'),
        content: Text('Aplikasi sudah kadarluarsa silahkan update'),
        actionsPadding: EdgeInsets.all(2),
      );
    },
  );
}

Future<void> showmodal(BuildContext context, String text) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // title: const Text('Basic dialog title'),
        content: Text(text),
        actionsPadding: EdgeInsets.all(2),
      );
    },
  );
}
