import 'package:flutter/material.dart';
import 'package:sinemabilet/views/bilet.dart';

class sinemadetay extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => sinemadetay(),
      );

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
          title: Text("Sinema Detay"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.network('lib/views/images/sinema.jpg',
                    width: genislik * 0.95,
                    height: yukseklik * 0.25,
                    fit: BoxFit.fill),
              ),
              SizedBox(height: 30),
              Text(
                "Site Sinemaları",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  Icon(Icons.location_on),
                  SizedBox(width: 10),
                  Flexible(
                      child: Text(
                          "Yenibosna Zafer Mahallesi, Değrimenbahçe Caddesi, No:10, Bahçelievler/İstanbul")),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  Icon(Icons.phone),
                  SizedBox(width: 10),
                  Text("(0212) 456 7898")
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  Icon(Icons.language),
                  SizedBox(width: 10),
                  Text("www.sitesinemalari.com")
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Vizyondaki Filmler",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              biletal(),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xffF4F3F9),
    );
  }
}
