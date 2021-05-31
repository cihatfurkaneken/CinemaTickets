import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fancy_bottom_bar/fancy_bottom_bar.dart';
import 'package:sinemabilet/models/Film.dart';
import 'package:sinemabilet/services/firestore_service.dart';
import 'package:sinemabilet/views/bilet.dart';
import 'package:sinemabilet/views/populer.dart';

import 'BiletSecimi.dart';

class anaekran extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => anaekran(),
      );
  @override
  _anaekranState createState() => _anaekranState();
}

class _anaekranState extends State<anaekran> {
  int selectedPos = 0;
  int abc = 0;
  int cbc = 10;
  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
          //YUKARIDA BULUNAN SİYAH BAR
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff434852),
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
            ),
            centerTitle: true,
            title: Text("Ana Ekran"),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: Color(0xffF4F3F9),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    "Popüler Filmler",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  biletal(), //Popüler filmlerin bulunduğu kısmın çağırılması.
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      color: Colors.black87,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 6),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Yeni Çıkanlar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Divider(),
                  StreamBuilder<List<Film>>(
                      // Yeni çıkanlar kısmının Firebase üzerinden çekilip sınıflara atılması
                      // ve gösterilmesi. Burada snapshot, filmlerin içeriklerini içeren sınıfı temsil eder
                      stream: FirestroeService.readFilms(),
                      builder: (context, snapshot) {
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 10),
                                    populer(
                                        pictureUrl: snapshot.data[4].resim,
                                        title: snapshot.data[4].FilmAdi,
                                        entry: snapshot.data[4]),
                                    SizedBox(width: 25),
                                    populer(
                                        pictureUrl: snapshot.data[5].resim,
                                        title: snapshot.data[5].FilmAdi,
                                        entry: snapshot.data[5]),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 10),
                                    populer(
                                      pictureUrl: snapshot.data[3].resim,
                                      title: snapshot.data[3].FilmAdi,
                                      entry: snapshot.data[3],
                                    ),
                                    SizedBox(width: 25),
                                    populer(
                                        pictureUrl: snapshot.data[2].resim,
                                        title: snapshot.data[2].FilmAdi,
                                        entry: snapshot.data[2]),
                                  ],
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        );
                      }),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      color: Colors.black87,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Bilet Satın almak için filmin üstüne tıklayın.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
