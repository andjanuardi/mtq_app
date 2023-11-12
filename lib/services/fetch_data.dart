import 'package:dio/dio.dart';

Future<List<Map<String, dynamic>>?> fetchData(String url) async {
  Dio dio = Dio();
  try {
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(response.data);
    } else {
      // Handle errors
      return [];
    }
  } catch (e) {
    print('Error: $e');
  }
  return null;
}
