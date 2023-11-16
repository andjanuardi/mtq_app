// import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/config/value.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Live extends StatefulWidget {
  const Live({super.key});

  @override
  State<Live> createState() => _LiveState();
}

class _LiveState extends State<Live> {
  YoutubeMetaData ytMetaData = YoutubeMetaData();

  String activeLink = '';

  YoutubePlayerController _youtubePlayerController =
      YoutubePlayerController(initialVideoId: '');

  Dio dio = Dio();
  List<Map<String, dynamic>> listLive = [];

  Future<void> fetchData() async {
    try {
      Response response = await dio.get('$ApiUrl/galeri/live');
      if (response.statusCode == 200) {
        setState(() {
          listLive = List<Map<String, dynamic>>.from(response.data);
        });
      } else {
        // Handle errors
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }

    try {
      Response response = await dio.get('$ApiUrl/config');
      if (response.statusCode == 200) {
        setState(() {
          _youtubePlayerController = YoutubePlayerController(
              initialVideoId: response.data['live'].toString(),
              flags: const YoutubePlayerFlags(isLive: true, autoPlay: true));
        });
      } else {
        // Handle errors
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void getMeta() {
    setState(() {
      ytMetaData = _youtubePlayerController.metadata;
    });
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([]);
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    _youtubePlayerController.removeListener(getMeta);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Column(children: [
      if (orientation == Orientation.portrait)
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
                    SystemChrome.setPreferredOrientations(
                        [DeviceOrientation.portraitUp]);
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'LIVE STREAMING',
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
      Container(
        width: double.infinity,
        child: _youtubePlayerController.initialVideoId == ''
            ? SizedBox(
                height: 200,
              )
            : YoutubePlayerBuilder(
                onExitFullScreen: () {
                  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
                  SystemChrome.setSystemUIOverlayStyle(
                      const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                  ));
                },
                builder: (context, player) => Column(
                  children: [
                    player,
                  ],
                ),
                player: YoutubePlayer(
                  onReady: () {
                    _youtubePlayerController.addListener(getMeta);
                  },
                  controller: _youtubePlayerController,
                  liveUIColor: Theme.of(context).primaryColor,
                ),
              ),
      ),
      if (ytMetaData.title != '' && orientation == Orientation.portrait)
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Column(
            children: [
              Text(
                '${ytMetaData.title}',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      if (orientation == Orientation.portrait)
        Expanded(
            child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: listLive.length,
          itemBuilder: (context, index) => Card(
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () {
                setState(() {
                  _youtubePlayerController = YoutubePlayerController(
                      initialVideoId: '',
                      flags: const YoutubePlayerFlags(
                          isLive: true, autoPlay: true));
                });
                setState(() {
                  _youtubePlayerController = YoutubePlayerController(
                      initialVideoId: listLive[index]['link'],
                      flags: const YoutubePlayerFlags(
                          isLive: true, autoPlay: true));
                });
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            '${listLive[index]['thumbnail_url']}'))),
                height: 200,
                child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    color: Colors.black.withAlpha(100),
                    child: Text(
                      '${listLive[index]['title']}\n\n${listLive[index]['author_name']}',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ),
        ))
    ]);
  }
}
