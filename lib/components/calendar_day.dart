import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sinemabilet/views/BiletSecimi.dart';

class CalendarDay extends StatefulWidget {
  //final String dayAbbreviation;
  final String dayNumber;

  bool isActive;
  CalendarDay({
    @required this.dayNumber,
    //this.dayAbbreviation,
    this.isActive = false,
  });

  @override
  _CalendarDayState createState() => _CalendarDayState();
}

class _CalendarDayState extends State<CalendarDay> {
  getCurrentDate() {
    final now = DateTime.now();

    return DateFormat('MMMM').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            widget.isActive = !widget.isActive;
          });
        },
        child: Container(
          width: 50.0,
          height: 65.0,
          decoration: BoxDecoration(
              color: widget.isActive ? Color(0xff434852) : null,
              borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.dayNumber,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold)),
              Text(
                getCurrentDate().toUpperCase(),
                style: TextStyle(
                  color: widget.isActive ? Colors.white54 : Colors.white54,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
