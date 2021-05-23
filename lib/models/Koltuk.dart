import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Koltuk {
  final String KoltukId;
  final String KoltukNo;
  final String SalonId;
  final bool Doluluk;
  Koltuk({
    @required this.KoltukId,
    this.KoltukNo,
    this.SalonId,
    this.Doluluk,
  });

  static Koltuk fromJson(Map<String, dynamic> json) => Koltuk(
        KoltukId: json['KoltukId'],
        KoltukNo: json['KoltukNo'],
        SalonId: json['SalonId'],
        Doluluk: json['Doluluk'],
      );

  Map<String, dynamic> toMap() {
    return {
      'FilmId': KoltukId,
      'FilmAdi': KoltukNo,
      'SalonId': SalonId,
      'Doluluk': Doluluk
    };
  }
}
