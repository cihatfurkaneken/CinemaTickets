import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sinemabilet/services/auth_service.dart';

class Kayit extends StatefulWidget {
  @override
  _KayitState createState() => _KayitState();
}

class _KayitState extends State<Kayit> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController isimController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String getCurrentUser() {
    final User user = firebaseAuth.currentUser;
    final uid = user.uid;
    return uid;
  }

  String getCurrentMail() {
    final User user = firebaseAuth.currentUser;
    final uid = user.email;
    return uid;
  }

  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffF4F3F9),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                  child: Text("Kayıt Ol",
                      style: TextStyle(fontSize: 34, color: Colors.black)),
                ),
                SizedBox(height: 30),
                Container(
                  width: genislik * 0.75,
                  height: yukseklik * 0.5,
                  child: Form(
                    child: Column(
                      key: _formKey,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(19.0),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              child: TextFormField(
                                controller: isimController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'İsim Soyisim',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    final snackBar = SnackBar(
                                        content: Text(
                                            'Lütfen Boş kısım bırakmayın.'));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(19.0),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 5),
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'E-Mail',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Stack(
                            alignment: const Alignment(0, 0),
                            children: <Widget>[
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        new BorderRadius.circular(19.0),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, right: 15, top: 5),
                                      child: TextFormField(
                                        controller: passwordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'Şifre',
                                        ),
                                      ))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 45,
                            width: genislik * 0.3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(21.0),
                                ),
                                primary: Color(0xffFF7E7E),
                              ),
                              onPressed: () {
                                if (emailController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty &&
                                    isimController.text.isNotEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(new SnackBar(
                                    duration: new Duration(seconds: 4),
                                    content: new Row(
                                      children: <Widget>[
                                        new CircularProgressIndicator(),
                                        new Text("Kayıt Tamamlanıyor....")
                                      ],
                                    ),
                                  ));
                                  loginAction().whenComplete(() {
                                    var newDocRef = FirebaseFirestore.instance
                                        .collection('Kullanicilar');
                                    newDocRef.add({
                                      'Isim': isimController.text.trim(),
                                      'KullaniciId': getCurrentUser(),
                                      'Mail': getCurrentMail(),
                                    });
                                  }).then(
                                      (value) => Navigator.of(context).pop());
                                } else {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('HATA'),
                                      content: const Text(
                                          'Mail ve Şifre kısımları boş olamaz.'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: const Text('Tamam'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                'Kayıt Ol',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Devam ederek tüm kuralları ve sözleşmeleri kabul etmiş sayılırsınz.",
                    style: TextStyle(fontSize: 14, color: Colors.redAccent),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> loginAction() async {
    await new Future.delayed(const Duration(seconds: 2));
    return context.read<AuthenticationService>().signUp(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
  }
}
