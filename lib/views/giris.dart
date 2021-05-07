import 'package:flutter/material.dart';

class giris extends StatefulWidget {
  @override
  _girisState createState() => _girisState();
}

class _LoginData {
  String email = '';
  String password = '';
}

class _girisState extends State<giris> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffF4F3F9),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: yukseklik * 0.15),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                child: Text("Sinema Bilet Satış Giriş",
                    style: TextStyle(fontSize: 34, color: Colors.black)),
              ),
              SizedBox(height: 30),
              Container(
                width: genislik * 0.75,
                height: yukseklik * 0.35,
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
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Kullanıcı Adı',
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
                                  borderRadius: new BorderRadius.circular(19.0),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, right: 15, top: 5),
                                    child: TextFormField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'Şifre',
                                        )))),
                            Positioned(
                                right: 15,
                                child: ElevatedButton(
                                    onPressed: () {
                                      // _controller.clear();
                                    },
                                    child: Text('Göster')))
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
                              //color: Color(0xffFF7E7E),
                              onPressed: () {
                                // Validate returns true if the form is valid, or false
                                // otherwise.
                                if (_formKey.currentState.validate()) {
                                  // If the form is valid, display a Snackbar.
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('Processing Data')));
                                }
                              },
                              child: Text(
                                'Giris',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),

              /*Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                child: Text(
                    "By continuing you agree Terms of Services & Privacy Policy",
                    style: TextStyle(fontSize: 21, color: Colors.redAccent)),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
