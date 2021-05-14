import 'package:flutter/material.dart';

class CienmaSeat extends StatefulWidget {
  bool isReserved;

  bool isSelected;

  CienmaSeat({this.isSelected = false, this.isReserved = false});

  @override
  _CienmaSeatState createState() => _CienmaSeatState();
}

class _CienmaSeatState extends State<CienmaSeat> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          !widget.isReserved ? widget.isSelected = !widget.isSelected : null;
        });
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
          width: MediaQuery.of(context).size.width / 15,
          height: MediaQuery.of(context).size.width / 15,
          decoration: BoxDecoration(
              color: widget.isSelected
                  ? Colors.red
                  : widget.isReserved
                      ? Colors.black
                      : null,
              border: !widget.isSelected && !widget.isReserved
                  ? Border.all(color: Colors.black, width: 1.0)
                  : null,
              borderRadius: BorderRadius.circular(5.0))),
    );
  }
}
