import 'package:flutter/material.dart';

class ayarlar extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => ayarlar(),
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
          title: Text("Kullanıcı"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15),
            //color: Color(0xffFF7E7E),
            height: yukseklik * 0.10,
            width: double.infinity,
            child: Text(
              "Hoş Geldin Cihat Furkan Eken",
              style: TextStyle(fontSize: 22, color: Colors.white),
              //textAlign: TextAlign.center,
            ),
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
                onTap: () => {},
              ),
              ListTile(
                leading: Icon(Icons.border_color),
                trailing: Icon(Icons.chevron_right),
                title: Text('Hata Bildir'),
                onTap: () => {Navigator.of(context).pop()},
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
                onTap: () => {Navigator.of(context).pop()},
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
