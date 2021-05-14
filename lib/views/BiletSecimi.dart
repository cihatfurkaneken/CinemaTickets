import 'package:flutter/material.dart';
import 'package:sinemabilet/components/calendar_day.dart';
import 'package:sinemabilet/components/cienma_seat.dart';
import 'package:sinemabilet/components/show_time.dart';
import 'package:intl/intl.dart';

class BiletSecimi extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => BiletSecimi(),
      );
  bool secilen;

  bool secilmeyen;
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text("Tarih Secimi"),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              width: MediaQuery.of(context).size.width * .9,
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
            Text("Seans Secimi"),
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
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Site Sinemaları'),
                      Text('Yenibosna, Istanbul',
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.0)),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Text('2D'),
                          SizedBox(width: 10.0),
                          Text('3D',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(width: 20.0),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 30.0,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            // Center(child: Image.asset('lib/views/inc.jpg')),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  // First Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                    ],
                  ),
                  // Second Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(
                        isReserved: true,
                      ),
                      CienmaSeat(),
                      CienmaSeat(),
                    ],
                  ),
                  // Third  Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(),
                      CienmaSeat(
                        isReserved: true,
                      ),
                      CienmaSeat(
                        isReserved: true,
                      ),
                    ],
                  ),
                  // 4TH Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(
                        isReserved: true,
                      ),
                      CienmaSeat(),
                      CienmaSeat(),
                    ],
                  ),
                  // 5TH Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                    ],
                  ),
                  // 6TH Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                    ],
                  ),
                  // final Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                      CienmaSeat(),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(),
                      CienmaSeat(),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      '30\$',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
                        child: Text('Pay',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold))),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
