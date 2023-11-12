import 'package:flutter/material.dart';

class CardJadwal extends StatelessWidget {
  const CardJadwal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
            highlightColor: Colors.transparent,
            onTap: () {},
            child: SizedBox(
              child: Container(
                  alignment: const Alignment(-1, -1),
                  child: Column(children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(100),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Icon(
                                  Icons.calendar_month,
                                  color: Theme.of(context).primaryColor,
                                )),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Sabtu, 28 Oktober 2023',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ])),
            )),
      ),
    );
  }
}
