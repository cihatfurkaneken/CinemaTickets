import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sinemabilet/models/Kullanici.dart';
import 'package:sinemabilet/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:sinemabilet/services/firestore_service.dart';
import 'package:sinemabilet/views/Biletlerim.dart';

class ayarlar extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => ayarlar(),
      );
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String getCurrentUser() {
    final User user = firebaseAuth.currentUser;
    final uid = user.uid;
    return uid;
  } //GİRİŞ YAPMIŞ KULLANICININ BİLGİLERİNİN ALINMASI FONKSİYONU

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
          title: Text("Kullanıcı"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15),
            height: yukseklik * 0.10,
            width: double.infinity,
            child: StreamBuilder<List<Kullanici>>(
                stream: FirestroeService.readKullanici(getCurrentUser()),
                builder: (context, snapshot) {
                  return Text(
                    "Hoş Geldin " + snapshot.data[0].Adi,
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  );
                }),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffFF7E7E),
            ),
          ),
          SizedBox(height: 30),
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.confirmation_num),
                trailing: Icon(Icons.chevron_right),
                title: Text('Biletlerim'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Biletlerim()));
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('Hakkında'),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  showAboutDialog(
                    context: context,
                    applicationVersion: '0.8.1',
                    applicationLegalese:
                        'Cihat Furkan Eken Tarafından tez projesi olarak geliştirilmiştir. Tüm hakkı saklıdır',
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Çıkış'),
                onTap: () {
                  context.read<AuthenticationService>().signOut();
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
