// fetch_kabupaten.dart
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mtq_app/models/model_kabupaten.dart';

class FetchKabupaten {
  final Dio _dio = Dio();

  Future<List<ModelKabupaten>> getKabupatenData() async {
    // try {
    final response =
        await _dio.get('http://localhost:8888/api/index.php/kabupaten');

    List<dynamic> data = json.decode(response.toString());
    return data.map((json) => ModelKabupaten.fromJson(json)).toList();

    // }
    //  catch (error) {
    //   throw Exception('Failed to load Kabupaten data : ${error}');
    // }
  }
}
