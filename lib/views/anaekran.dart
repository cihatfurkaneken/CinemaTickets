import 'package:flutter/material.dart';
import 'package:fancy_bottom_bar/fancy_bottom_bar.dart';
import 'package:sinemabilet/views/bilet.dart';
import 'package:sinemabilet/views/populer.dart';

class anaekran extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => anaekran(),
      );
  @override
  _anaekranState createState() => _anaekranState();
}

class _anaekranState extends State<anaekran> {
  int selectedPos = 0;
  final List<String> movi = [
    "lib/views/joker.jpg",
    "lib/views/togo.jpg",
    "lib/views/int.jpg",
    "lib/views/inc.jpg"
  ];

  final tabItems = [
    FancyBottomItem(title: Text("Satın Al"), icon: Icon(Icons.theaters)),
    FancyBottomItem(title: Text("Sinemalar"), icon: Icon(Icons.theater_comedy)),
    FancyBottomItem(title: Text("Filmler"), icon: Icon(Icons.movie)),
    FancyBottomItem(title: Text("Profil"), icon: Icon(Icons.person)),
  ];
  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: Color(0xff434852),
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
            ),
            centerTitle: true,
            title: tabItems[selectedPos].title,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: Color(0xffF4F3F9),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Yeni Çıkanlar",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  biletal(),
                  Text(
                    "Popüler Filmler",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Container(
                      width: double.infinity,
                      //color: Colors.red,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              populer(
                                pictureUrl: movi[0],
                                title: 'Interstellar',
                              ),
                              SizedBox(width: genislik * 0.12),
                              populer(
                                pictureUrl: movi[1],
                                title: 'adsfasdf',
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: <Widget>[
                              populer(
                                pictureUrl: movi[2],
                                title: 'sdfgsdfg',
                              ),
                              SizedBox(width: genislik * 0.12),
                              populer(
                                pictureUrl: movi[3],
                                title: 'qweqweq',
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Bilet Satın almak için filmin üstüne tıklayın.",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
