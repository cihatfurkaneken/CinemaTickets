import 'package:flutter/material.dart';
import 'package:sinemabilet/views/anaekran.dart';
import 'package:sinemabilet/views/tabpage.dart';

import 'Biletlerim.dart';

class basarili extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF4F3F9),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.verified,
            color: Colors.greenAccent,
            size: 80,
          ),
          SizedBox(height: 10),
          Text(
            "Bilet Rezarvasyonu Tamamlandı",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
          ),
          SizedBox(height: 10),
          Text(
            "Lütfen Seans saatinden en az 30 dakika önce biletinizi alıp ödemeyi yapınız. Biletlerim sekmesinden biletinizi kontrol edebilirsiniz.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                decoration: TextDecoration.none),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TabsPage()));
            },
            child: Text("Ana Sayfa"),
            style: ElevatedButton.styleFrom(
                primary: Color(0xffFF7E7E),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
