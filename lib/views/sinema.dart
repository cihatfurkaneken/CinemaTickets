import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sinemabilet/models/Film.dart';
import 'package:sinemabilet/services/firestore_service.dart';
import 'package:sinemabilet/views/sinemadetay.dart';
//import 'package:sinemabilet/views/anaekran.dart';

class sinema extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => sinema(),
      );
  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    final CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('Sinema');
    return Scaffold(
      appBar: PreferredSize(
        // YUKARIDAKİ SİYAH BAR
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
          title: Text("Vizyondakiler"),
        ),
      ),
      body: StreamBuilder<List<Film>>(
          // Filmlerin Firebase üzerinden çekilip sınıflara atılmasıve gösterilmesi.
          // Burada snapshot, filmlerin içeriklerini içeren sınıfı temsil eder
          stream: FirestroeService.readFilms(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            //Tıklanan filmin detaylarına gidiş fonksiyonu
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    sinemadetay(entry: snapshot.data[index])));
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Card(
                                  color: Color(0xffffffff),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(children: <Widget>[
                                    Container(
                                      decoration: new BoxDecoration(
                                        color: Color(0xffFF7E7E),
                                        borderRadius: new BorderRadius.only(
                                            topLeft: const Radius.circular(10),
                                            bottomLeft:
                                                const Radius.circular(10)),
                                      ),
                                      height: yukseklik * 0.17,
                                      width: genislik * 0.04,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                snapshot.data[index].resim),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        width: genislik * 0.4,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                snapshot.data[index].FilmAdi,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 24),
                                              ),
                                              Text(
                                                snapshot.data[index].Bilgi,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                              )
                                            ])),
                                    Row(children: <Widget>[
                                      Text(
                                        "Detay",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 24,
                                      )
                                    ])
                                  ]))))
                    ],
                  );
                });
          }),
    );
  }
}
