import 'package:flutter/material.dart';

class BtnMenuLokasi extends StatelessWidget {
  const BtnMenuLokasi({
    super.key,
    required String icon,
    required String text,
    required String url,
  })  : _icon = icon,
        _text = text,
        _url = url;

  final String _icon;
  final String _text;
  final String _url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      child: Column(
        children: [
          Material(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Colors.white.withAlpha(100),
              highlightColor: Colors.white.withAlpha(100),
              onTap: () {
                Navigator.pushNamed(context, _url);
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    height: 75,
                    width: double.infinity,
                    child: Image.asset('assets/images/icons/$_icon'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 30,
            child: Text(
              _text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
