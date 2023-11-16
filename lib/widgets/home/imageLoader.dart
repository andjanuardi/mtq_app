import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  final String url;
  final double width = double.infinity;
  final double height = double.infinity;
  final BoxFit fit = BoxFit.cover;
  const ImageLoader({super.key, required url, width, height, fit}) : url = url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: fit)),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('assets/images/card/default.jpg').image,
                fit: fit)),
      ),
    );
  }
}
