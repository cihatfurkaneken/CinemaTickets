import 'package:flutter/material.dart';
import 'package:sinemabilet/models/Film.dart';
import 'package:sinemabilet/views/BiletSecimi.dart';

class populer extends StatelessWidget {
  final String title;
  final String pictureUrl;
  final Film entry;
  const populer({
    Key key,
    @required this.title,
    @required this.pictureUrl,
    @required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        SizedBox(height: 5),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BiletSecimi(entry: entry)));
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.30,
            width: genislik > 1024
                ? genislik * 0.15
                : genislik > 768
                    ? genislik * 0.2
                    : genislik * 0.40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              /* topLeft: Radius.circular(28.0),
                                    topRight: Radius.circular(28.0),*/

              color: const Color(0xff000000),
              image: DecorationImage(
                image: NetworkImage(pictureUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
