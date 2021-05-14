import 'package:flutter/material.dart';
import 'package:sinemabilet/views/BiletSecimi.dart';

class populer extends StatelessWidget {
  final String title;
  final String pictureUrl;
  const populer({
    Key key,
    @required this.title,
    @required this.pictureUrl,
  });

  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        InkWell(
          onTap: () => Navigator.of(context).push(
            BiletSecimi.route(),
          ),
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
                image: AssetImage(pictureUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
