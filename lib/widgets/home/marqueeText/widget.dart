import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:mtq_app/config/value.dart';

class MarqueeText extends StatefulWidget {
  const MarqueeText({
    super.key,
  });

  @override
  State<MarqueeText> createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText> {
  Dio dio = Dio();
  String text = '';

  Future<void> fetchData() async {
    try {
      Response response = await dio.get('$ApiUrl/config');
      if (response.statusCode == 200) {
        setState(() {
          text = response.data['marqueeText'].toString();
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
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withAlpha(100),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 20,
        child: Marquee(text: ' • ${text}'));
  }
}
