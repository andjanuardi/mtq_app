import 'package:dio/dio.dart';

Future<List<Map<String, dynamic>>?> getKabupaten() async {
  final dio = Dio();
  const url = 'http://localhost:8888/api/index.php/kabupaten';

  try {
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(response.data);
      return data;
    } else {
      print('Gagal mengambil data. Status code: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    print('Error: $error');
    return null;
  }
}
