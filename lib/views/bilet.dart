import 'package:flutter/material.dart';

class biletal extends StatelessWidget {
  final List<String> numbers = ["JOKER", "TOGO", "Fenerbahçe", "Soldierbirth"];
  final List<String> movi = [
    "lib/views/joker.jpg",
    "lib/views/togo.jpg",
    "lib/views/int.jpg",
    "lib/views/inc.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        //padding: EdgeInsets.symmetric(horizontal: 0),
        height: MediaQuery.of(context).size.height * 0.45,
        //color: Colors.red,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: numbers.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: genislik > 1024
                        ? genislik * 0.15
                        : genislik > 768
                            ? genislik * 0.2
                            : genislik * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28.0),
                        topRight: Radius.circular(28.0),
                      ),
                      color: const Color(0xff000000),
                      image: DecorationImage(
                        image: AssetImage(movi[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          numbers[index],
                          style: TextStyle(fontSize: 20, color: Colors.white),
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
                            : genislik * 0.35,
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
                        onPressed: () {},
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
            }),
      ),
    );
  }
}
