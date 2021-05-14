import 'package:flutter/material.dart';
import 'package:sinemabilet/models/person.dart';
import 'package:sinemabilet/views/sinemadetay.dart';
//import 'package:sinemabilet/views/anaekran.dart';

class sinema extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => sinema(),
      );
  List<Person> persons = [
    Person(
        name: 'Site Sinemaları',
        profileImg: 'lib/views/joker.jpg',
        bio: "Yemek, VMAX, Dolby, 3D"),
    Person(
        name: 'CineMaximum Akasya',
        profileImg: 'lib/views/inc.jpg',
        bio: "3D, Popcorn, Çift Koltuk"),
    Person(
        name: 'CinemaVip Bakırköy',
        profileImg: 'lib/views/togo.jpg',
        bio: "DMAX, 3D ,Konfor "),
    Person(
        name: 'Gebze Sinemaları',
        profileImg: 'lib/views/int.jpg',
        bio: "Yemek, VMAX, Dolby, 3Dr ")
  ];
  Widget personDetailCard(Person, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        sinemadetay.route(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: Color(0xffffffff),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(Person.profileImg)))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      Person.name,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      Person.bio,
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          title: Text("Sinemalar"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
          child: Column(
            children: <Widget>[
              Column(
                children: persons.map((p) {
                  return personDetailCard(p, context);
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
