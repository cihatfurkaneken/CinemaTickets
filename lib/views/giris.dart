import 'package:flutter/material.dart';

class giris extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: Color(0xffff7e7e),
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 38,
                ),
                tooltip: 'menu',
                onPressed: () {
                  // _settingModalBottomSheet(context);
                },
                padding: EdgeInsets.symmetric(horizontal: 36)),
          ],
          centerTitle: true,
          title: Text(
            "Kart Oyunu",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      //barrierColor: Colors.greenAccent,
      //background color for modal bottom screen
      backgroundColor: Color(0xffff7e7e),
      //elevates modal bottom screen
      elevation: 10,
      // gives rounded corner to modal bottom screen
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.0),
          topRight: Radius.circular(28.0),
        ),
      ),
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.all(10),
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                  leading: new Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  title: new Text(
                    'Geri Dön',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () => {}),
              new ListTile(
                leading: new Icon(
                  Icons.report_problem,
                  color: Colors.white,
                ),
                title: new Text(
                  'Bildir',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {},
              ),
              new ListTile(
                leading: new Icon(
                  Icons.table_chart,
                  color: Colors.white,
                ),
                title: new Text(
                  'Skor Tablosu',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {},
              ),
            ],
          ),
        );
      });
}
