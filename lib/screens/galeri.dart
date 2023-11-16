import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/main.dart';
import 'package:mtq_app/screens/imgView.dart';
import 'package:mtq_app/widgets/home/imageLoader.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Galeri extends StatefulWidget {
  const Galeri({Key? key}) : super(key: key);

  @override
  State<Galeri> createState() => _GaleriState();
}

class _GaleriState extends State<Galeri> with TickerProviderStateMixin {
  late TabController _tabController;

  Dio dio = Dio();
  List<Map<String, dynamic>> listFoto = [];
  List<Map<String, dynamic>> listVideo = [];

  Future<void> fetchData() async {
    try {
      Response response = await dio.get('$ApiUrl/galeri/foto');
      if (response.statusCode == 200) {
        setState(() {
          listFoto = List<Map<String, dynamic>>.from(response.data);
        });
      } else {
        // Handle errors
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }

    try {
      Response response = await dio.get('$ApiUrl/galeri/video');
      if (response.statusCode == 200) {
        setState(() {
          listVideo = List<Map<String, dynamic>>.from(response.data);
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
    fetchData();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  'GALERI FOTO / VIDEO',
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
        TabBar(
          indicatorColor: Theme.of(context).primaryColor,
          labelColor: Colors.black,
          tabs: const <Widget>[
            Tab(text: 'Album'),
            Tab(text: 'Video'),
          ],
          controller: _tabController,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: listFoto.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1 / 1.5, crossAxisCount: 3),
                    itemBuilder: (context, index) => Card(
                          child: InkWell(
                            highlightColor: Colors.white.withAlpha(100),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SafeArea(
                                            child: LayoutApp(
                                              showNavBar: false,
                                              child: ImgViewer(
                                                  data: listFoto[index],
                                                  slider: false),
                                            ),
                                          )));
                            },
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                          '${ApiUrl}/assets/images/galeri/${listFoto[index]['gambar']}'))),
                              // child: Container(
                              //     padding: EdgeInsets.all(8),
                              //     color: Theme.of(context)
                              //         .primaryColor
                              //         .withAlpha(100),
                              //     child: Text(
                              //       '${listFoto[index]['nama']}',
                              //       style: TextStyle(color: Colors.white),
                              //     )),
                            ),
                          ),
                        )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ListView.separated(
                  padding: EdgeInsets.all(10),
                  itemCount: listVideo.length,
                  itemBuilder: (context, index) => Card(
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      onTap: () {
                        openLink(
                            'https://www.youtube.com/watch?v=${listVideo[index]['link']}');
                      },
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                    '${listVideo[index]['thumbnail_url']}'))),
                        height: 200,
                        child: Container(
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            color: Colors.black.withAlpha(100),
                            child: RichText(
                              text: TextSpan(
                                  text:
                                      '${listVideo[index]['title']}\n\nChannel : ${listVideo[index]['author_name']} ',
                                  style: TextStyle(color: Colors.white)),
                            )),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
