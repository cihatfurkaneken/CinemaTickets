import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sinemabilet/models/Film.dart';
import 'package:sinemabilet/services/firestore_service.dart';
import 'package:sinemabilet/views/basarili.dart';
import 'package:uuid/uuid.dart';

class BiletDetay extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => BiletDetay(),
      );
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String getCurrentUser() {
    //GİRİŞ YAPAN KULLANICI BİLGİLERİNİ ALIYOR, BİLET BU KİŞİNİN HESABINA VERİLECEK
    final User user = firebaseAuth.currentUser;
    final uid = user.uid;
    return uid;
  }

  final List<String> koltuklar;
  final String seans;
  final String gun;
  final String fiyat;
  final String tarih;
  final Film film;
  final List<String> koltukIds;
  final String secilenTarih;
  final String secilenSeans;

  BiletDetay({
    //YAPICI METOTLAR, BİLGİLER KOLTUK SEÇİMİ SAYFASINDAN BURAYA YOLLANDI
    Key key,
    this.koltuklar,
    this.seans,
    this.gun,
    this.fiyat,
    this.tarih,
    this.film,
    this.koltukIds,
    this.secilenTarih,
    this.secilenSeans,
  }) : super(key: key);
  final firestoreInstance = FirebaseFirestore.instance;
  void onSeenMessages() async {
    // EĞER SEÇİLEN KOLTUKLAR BAŞARI İLE ALINIRSA
    // KOLTUKLARI DOLU HALE GETİRECEK VERİTABANI KODLARININ BULUNDUĞU FONKSİYON
    CollectionReference ref = FirebaseFirestore.instance.collection('Koltuk');
    for (var i = 0; i < koltukIds.length; i++) {
      QuerySnapshot eventsQuery =
          await ref.where('KoltukId', isEqualTo: koltukIds[i]).get();
      eventsQuery.docs.forEach((msgDoc) {
        msgDoc.reference
            .collection('Tarih')
            .doc(secilenTarih)
            .collection('Seans')
            .doc(secilenSeans)
            .set({'Doluluk': true});
      });
    }
  }

  getTarih() {
    final now = DateTime.now();
    return DateFormat.MMMM('tr_TR').format(now);
  }

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
          title: Text("Önizleme"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: yukseklik * 0.08,
                  child: Column(children: <Widget>[
                    Text(
                      "Film",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      film.FilmAdi,
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    )
                  ]),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: yukseklik * 0.08,
                  child: Column(children: <Widget>[
                    Text(
                      "Tarih",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      gun + " " + tarih,
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    )
                  ]),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: yukseklik * 0.08,
                  child: Column(children: <Widget>[
                    Text(
                      "Salon",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      film.Salon,
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    )
                  ]),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: yukseklik * 0.08,
                  child: Column(children: <Widget>[
                    Text(
                      "Seans",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      seans,
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    )
                  ]),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: yukseklik * 0.08,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Koltuk",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 5),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: koltuklar.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 5.0),
                                    width:
                                        MediaQuery.of(context).size.width / 15,
                                    height:
                                        MediaQuery.of(context).size.width / 15,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Text(
                                      koltuklar[index],
                                      textAlign: TextAlign.center,
                                    )),
                          ),
                        ),
                      ]),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton.icon(
                icon: Icon(Icons.done_outline_outlined, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(21.0),
                  ),
                  primary: Color(0xffFF7E7E),
                ),
                onPressed: () async {
                  await FirestroeService.addItem(
                          //FİREBASE'E VERİ EKLEME
                          seans: seans,
                          tarih: gun + " " + getTarih(),
                          biletId: Uuid().v1(),
                          filmId: film.FilmAdi,
                          koltuk: koltuklar,
                          userUid: getCurrentUser(),
                          salon: film.Salon)
                      .then((result) {
                    print("başarılı");
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => basarili()));
                    //İŞLEM BAŞARILI İSE BAŞARILI SAYFASINA YÖNLENDİR
                  }).onError((error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                      duration: new Duration(seconds: 4),
                      content: new Row(
                        children: <Widget>[
                          Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                          Text("Hata oluştu lütfen tekrar deneyin.")
                        ], // İŞLEM BAŞARISIZ OLURSA HATA OLUŞTU KISMI ÇIKAR
                      ),
                    ));
                  });
                  onSeenMessages(); // KOLTUKLARI DOLU HALE GETİRME FONKİSYONU ÇAĞRILIYOR
                },
                label: Text(
                  'Devam Et',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
