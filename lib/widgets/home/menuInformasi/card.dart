import 'package:flutter/material.dart';

class CardInformasi extends StatelessWidget {
  const CardInformasi({
    super.key,
    required text,
    required imageUrl,
    required icon,
    required url,
  })  : _text = text,
        _imageUrl = imageUrl,
        _icon = icon,
        _url = url;

  final String _text;
  final String _imageUrl;
  final IconData _icon;
  final String _url;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      elevation: 2,
      child: InkWell(
          splashColor: Colors.white.withAlpha(100),
          highlightColor: Colors.white.withAlpha(100),
          onTap: () {
            Navigator.pushNamed(context, _url);
          },
          child: Ink(
              height: 100,
              width: 160,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        _imageUrl,
                      ).image)),
              child: Column(
                children: [
                  const Expanded(child: SizedBox()),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    color: Theme.of(context).primaryColor.withAlpha(200),
                    child: Row(
                      children: [
                        Icon(_icon, color: Colors.white),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            _text,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
