import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sinemabilet/components/calendar_day.dart';
import 'package:sinemabilet/components/cienma_seat.dart';
import 'package:sinemabilet/components/show_time.dart';
import 'package:intl/intl.dart';
import 'package:sinemabilet/models/Film.dart';
import 'package:sinemabilet/models/Koltuk.dart';
import 'package:sinemabilet/models/Sinema.dart';
import 'package:sinemabilet/services/firestore_service.dart';

class BiletSecimi extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => BiletSecimi(),
      );
  bool secilen;
  bool secilmeyen;
  final Film entry;
  BiletSecimi({this.entry});

  List<Widget> getRandomWidgetArray(AsyncSnapshot<List<Koltuk>> snapshot) {
    List<Widget> lines = [];
    int satir = 1;
    for (var i = 1; i <= 1; i++) {
      List<Widget> gameCells = [];
      for (var j = 1; j < snapshot.data.length; j++) {
        gameCells.add(CienmaSeat(
            numara: snapshot.data[satir].KoltukNo,
            isReserved: snapshot.data[satir].Doluluk));
        satir++;
      }
      lines.add(Wrap(children: gameCells));
    }
    return lines;
  }

  @override
  _BiletSecimiState createState() => _BiletSecimiState();
}

getCurrentDate(int i) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day + i);
  return DateFormat('dd').format(today);
}

class _BiletSecimiState extends State<BiletSecimi> {
  final BoxDecoration kRoundedFadedBorder = BoxDecoration(
      border: Border.all(color: Colors.white54, width: .5),
      borderRadius: BorderRadius.circular(15.0));
  final firestoreInstance = FirebaseFirestore.instance;
  int abcd = 9;
  int cbc = 10;
  String _selectedLocation; // Option 2
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
          title: Text("Satın Al"),
        ),
      ),
      body: SingleChildScrollView(
        //scrollDirection: Axis.vertical,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 10),
            Center(child: Text("Tarih Seçimi")),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Color(0xffFF7E7E),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  topLeft: Radius.circular(25.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      CalendarDay(
                        dayNumber: getCurrentDate(0),
                        isActive: true,
                      ),
                      CalendarDay(
                        dayNumber: getCurrentDate(1),
                      ),
                      CalendarDay(
                        dayNumber: getCurrentDate(2),
                      ),
                      CalendarDay(
                        dayNumber: getCurrentDate(3),
                      ),
                      CalendarDay(
                        dayNumber: getCurrentDate(4),
                      ),
                      CalendarDay(
                        dayNumber: getCurrentDate(5),
                      ),
                      CalendarDay(
                        dayNumber: getCurrentDate(6),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(child: Text("Seans Seçimi")),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ShowTime(
                    time: '11:00',
                    price: 5,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: true,
                  ),
                  ShowTime(
                    time: '15:30',
                    price: 10,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '19:30',
                    price: 10,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '21:30',
                    price: 10,
                    isActive: false,
                  ),
                ],
              ),
            ),
            Center(
              child: StreamBuilder<List<Sinema>>(
                  stream: FirestroeService.readTodos(),
                  builder: (context, snapshot) {
                    List<DropdownMenuItem> currencyItems = [];
                    for (int i = 0; i < snapshot.data.length; i++) {
                      Sinema snap = snapshot.data[i];
                      currencyItems.add(
                        DropdownMenuItem(
                          child: Text(
                            snap.SinemaAdi,
                            style: TextStyle(color: Color(0xff11b719)),
                          ),
                          value: "${snap.SinemaAdi}",
                        ),
                      );
                    }
                    return DropdownButton(
                      items: currencyItems,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      underline: Container(
                        height: 2,
                        color: Colors.redAccent,
                      ),
                      hint: Text('Sinema Seçiniz'),
                      value: _selectedLocation,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedLocation = newValue;
                        });
                        print(_selectedLocation);
                      },
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.tv,
                    color: Colors.redAccent,
                    size: 25.0,
                  ),
                  SizedBox(width: 10.0),
                  Row(
                    children: <Widget>[
                      Text(widget.entry.FilmAdi,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      SizedBox(width: 10.0),
                      Text(replaceWhitespacesUsingRegex(
                          widget.entry.Bilgi, '|')),
                    ],
                  ),
                  SizedBox(width: 5.0),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 24.0,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  StreamBuilder<List<Koltuk>>(
                      stream: FirestroeService.readKoltuk(widget.entry.Salon),
                      builder: (context, snapshot) {
                        return Column(
                            children: widget.getRandomWidgetArray(snapshot));
                      })
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    "1",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(25.0))),
                  child: InkWell(
                      onTap: () {
                        firestoreInstance.collection("Koltuk").add({
                          "Doluluk": false,
                          "KoltukId": abcd.toString(),
                          "SalonId": "4",
                          "KoltukNo": cbc.toString()
                        }).then((value) {
                          print(value.id);
                        });
                        abcd++;
                        cbc++;
                        print(cbc.toString());
                        print(abcd.toString());
                      },
                      child: Text('Pay',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  /* Widget _buildRow(BuildContext context) {
    return Column(children: widget.getRandomWidgetArray());
  }*/
}

String replaceWhitespacesUsingRegex(String s, String replace) {
  if (s == null) {
    return null;
  }
  final pattern = RegExp('\\s+');
  return s.replaceAll(pattern, replace);
}

/*return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          !widget.isReserved ? widget.isSelected = !widget.isSelected : null;
        });
      }, */
