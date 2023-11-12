import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

const double TabletWidth = 480;

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

const String ApiUrl = 'http://192.168.137.1:8888/api/index.php/';
