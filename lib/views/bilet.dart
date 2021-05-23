import 'package:flutter/material.dart';
import 'package:sinemabilet/models/Film.dart';
import 'package:sinemabilet/services/firestore_service.dart';
import 'package:sinemabilet/views/BiletSecimi.dart';

class biletal extends StatelessWidget {
  final List<String> numbers = ["JOKER", "TOGO", "Fenerbahçe", "Soldierbirth"];
  final List<String> movi = [
    "lib/views/images/joker.jpg",
    "lib/views/images/togo.jpg",
    "lib/views/images/int.jpg",
    "lib/views/images/inc.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.40,
          child: StreamBuilder<List<Film>>(
              stream: FirestroeService.readFilms(),
              builder: (context, snapshot) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * 0.28,
                            width: genislik > 1024
                                ? genislik * 0.15
                                : genislik > 768
                                    ? genislik * 0.2
                                    : genislik * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(28.0),
                                topRight: Radius.circular(28.0),
                              ),
                              color: const Color(0xff000000),
                              image: DecorationImage(
                                image: NetworkImage(snapshot.data[index].resim),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  snapshot.data[index].FilmAdi,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: genislik > 1024
                                ? genislik * 0.15
                                : genislik > 768
                                    ? genislik * 0.2
                                    : genislik * 0.45,
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(28.0),
                                bottomLeft: Radius.circular(28.0),
                              ),
                              color: const Color(0xff434852),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, 6),
                                  blurRadius: 0,
                                ),
                              ],
                            ),
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => BiletSecimi(
                                          entry: snapshot.data[index])));
                                },
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                  //padding: EdgeInsets.all(0.0)
                                ),
                                child: Text("Bilet Al"),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              }),
        ));
  }
}
