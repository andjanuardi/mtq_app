import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class MarqueeText extends StatelessWidget {
  const MarqueeText({
    super.key,
    required text,
  }) : _text = text;

  final String? _text;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withAlpha(100),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 20,
        child: Marquee(text: ' $_text'));
  }
}
