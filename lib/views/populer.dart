import 'package:flutter/material.dart';

class populer extends StatelessWidget {
  final List<String> movi = [
    "lib/views/joker.jpg",
    "lib/views/togo.jpg",
    "lib/views/int.jpg",
    "lib/views/inc.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Text(
          "Interstellar",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        InkWell(
          onTap: () {
            print("Container clicked");
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: genislik > 1024
                ? genislik * 0.15
                : genislik > 768
                    ? genislik * 0.2
                    : genislik * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              /* topLeft: Radius.circular(28.0),
                                    topRight: Radius.circular(28.0),*/

              color: const Color(0xff000000),
              image: DecorationImage(
                image: AssetImage("lib/views/inc.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
