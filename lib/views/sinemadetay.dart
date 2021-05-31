import 'package:flutter/material.dart';
import 'package:sinemabilet/models/Film.dart';
import 'package:sinemabilet/views/bilet.dart';
import 'BiletSecimi.dart';

class sinemadetay extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => sinemadetay(),
      );
  final Film entry;
  sinemadetay({this.entry});
  //YAPICI METOD İLE TIKLANAN FİLMİN DETAYLARI BURAYA AKTARILDI
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
          title: Text("Film Detay"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: Image.network(entry.resim,
                  width: genislik * 0.75,
                  height: yukseklik * 0.6,
                  fit: BoxFit.fill),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: new BoxDecoration(
                color: Color(0xffFF7E7E),
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15)),
              ),
              height: yukseklik * 0.07,
              width: genislik * 1,
              child: Text(
                entry.FilmAdi,
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                color: Colors.white,
                child: Column(children: <Widget>[
                  SizedBox(height: 30),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.info,
                        size: 26,
                      ),
                      SizedBox(width: 10),
                      Text(
                        entry.Bilgi,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(
                      thickness: 5,
                      endIndent: genislik * 0.85,
                      color: Color(0xffFF7E7E)),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Icon(Icons.theater_comedy, size: 26),
                      SizedBox(width: 10),
                      Flexible(
                          child: Text("Salon" + " " + entry.Salon,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)))
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(
                      thickness: 5,
                      endIndent: genislik * 0.85,
                      color: Color(0xffFF7E7E)),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Icon(Icons.timer, size: 26),
                      SizedBox(width: 10),
                      Flexible(
                          child: Text(entry.Sure + " " + "Dakika",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)))
                    ],
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      //BİLET AL BUTONUNA TIKLANINCA FİLME GÖRE KOLTUK SEÇME SAYFASINA YÖNLEDİRİYOR
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BiletSecimi(entry: entry)));
                    },
                    child: Text("Bilet Al"),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffFF7E7E),
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 30),
                  Divider(
                    thickness: 3,
                    color: Color(0xffFF7E7E),
                  ),
                  Text(
                    "Popüler Filmler",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  biletal(),
                ])),
          ],
        ),
      ),
      backgroundColor: Color(0xffF4F3F9),
    );
  }
}
