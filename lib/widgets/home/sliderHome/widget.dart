import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mtq_app/config/value.dart';
import 'package:mtq_app/main.dart';
import 'package:mtq_app/screens/imgView.dart';
import 'package:mtq_app/widgets/home/imageLoader.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderHome extends StatefulWidget {
  const SliderHome({
    super.key,
  });

  @override
  State<SliderHome> createState() => _SliderHomeState();
}

class _SliderHomeState extends State<SliderHome> {
  int sliderIndex = 0;

  Dio dio = Dio();
  List<Map<String, dynamic>> listSlider = [];

  Future<void> fetchData() async {
    try {
      Response response = await dio.get('$ApiUrl/slider');
      if (response.statusCode == 200) {
        setState(() {
          listSlider = List<Map<String, dynamic>>.from(response.data);
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
    bool isTablet = MediaQuery.of(context).size.width > TabletWidth;

    return SizedBox(
      width: double.infinity,
      height: isTablet ? null : 260,
      child: Stack(
        children: [
          Column(
            children: [
              Visibility(
                visible: !isTablet,
                child: CarouselSlider(
                    items: listSlider
                        .map(
                          (e) => InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SafeArea(
                                          child: LayoutApp(
                                              showNavBar: false,
                                              child: ImgViewer(
                                                slider: true,
                                                data: e,
                                              )))));
                            },
                            highlightColor: Colors.white.withAlpha(100),
                            child: Container(
                              child: Ink(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: CachedNetworkImageProvider(
                                              '${ApiUrl}/assets/images/slider/${e['gambar']}')))),
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            sliderIndex = index;
                          });
                        },
                        viewportFraction: 1,
                        autoPlay: true,
                        aspectRatio: 9 / 6,
                        height: 200)),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: !isTablet,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: AnimatedSmoothIndicator(
                        effect: ExpandingDotsEffect(
                            dotColor: Colors.white.withAlpha(100),
                            activeDotColor: Theme.of(context).primaryColor),
                        activeIndex: sliderIndex,
                        count: listSlider.length),
                  ),
                ),
              ),
              Padding(
                padding: isTablet
                    ? EdgeInsets.zero
                    : const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, '/imgviewer');
                  },
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 1),
                            blurRadius: 6,
                            spreadRadius: -4)
                      ],
                      color: Colors.white,
                      borderRadius: isTablet
                          ? const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))
                          : const BorderRadius.all(Radius.circular(20)),
                      image: isTablet
                          ? DecorationImage(
                              opacity: 0.3,
                              alignment: const Alignment(-1, 1),
                              image: Image.asset(
                                      'assets/images/motif/motif_lapik_top_left.png')
                                  .image)
                          : DecorationImage(
                              // opacity: 0.3,
                              alignment: const Alignment(1, -1),
                              image: Image.asset(
                                      'assets/images/motif/motif_lapik2_bottom_right.png')
                                  .image),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                'assets/images/logo/logo.png',
                                height: 70,
                                fit: BoxFit.cover,
                                width: 70,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'MTQ ACEH XXXVI 2023',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 20),
                                    ),
                                    const Text(
                                      'Kabupaten Simeulue',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Visibility(
                                      visible: isTablet,
                                      child: Container(
                                        height: 25,
                                        width: double.infinity,
                                        alignment: Alignment.centerLeft,
                                        child: AnimatedSmoothIndicator(
                                            effect: ExpandingDotsEffect(
                                                dotHeight: 10,
                                                dotWidth: 10,
                                                spacing: 4,
                                                dotColor: Theme.of(context)
                                                    .primaryColor
                                                    .withAlpha(100),
                                                activeDotColor:
                                                    Theme.of(context)
                                                        .primaryColor),
                                            activeIndex: sliderIndex,
                                            count: listSlider.length),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              visible: isTablet,
                              child: Expanded(
                                flex: 2,
                                child: Stack(
                                  children: [
                                    Container(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withAlpha(10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: CarouselSlider(
                                          items: listSlider
                                              .map((e) => InkWell(
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                          context, '/imgviewer',
                                                          arguments: e);
                                                    },
                                                    highlightColor: Colors.white
                                                        .withAlpha(100),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          image: DecorationImage(
                                                              image: CachedNetworkImageProvider(
                                                                  '${ApiUrl}/assets/images/slider/${e['gambar']}'),
                                                              fit: BoxFit.cover,
                                                              alignment:
                                                                  Alignment
                                                                      .center)),
                                                    ),
                                                  ))
                                              .toList(),
                                          options: CarouselOptions(
                                              onPageChanged: (index, reason) {
                                                setState(() {
                                                  sliderIndex = index;
                                                });
                                              },
                                              viewportFraction: 0.6,
                                              enlargeCenterPage: true,
                                              enlargeFactor: 0.3,
                                              autoPlay: true,
                                              aspectRatio: 9 / 6,
                                              height: 100)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ].animate(interval: 200.ms).fade(begin: 0.5).slideY(begin: -0.2),
      ),
    );
  }
}
