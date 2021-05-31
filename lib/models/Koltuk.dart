import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Koltuk {
  final String KoltukId;
  final String KoltukNo;
  final String SalonId;
  final bool Doluluk;
  final String docId;
  Koltuk({
    this.KoltukId,
    this.KoltukNo,
    this.SalonId,
    this.Doluluk,
    this.docId,
  });

  static Koltuk fromJson(Map<String, dynamic> json) => Koltuk(
      KoltukId: json['KoltukId'],
      KoltukNo: json['KoltukNo'],
      SalonId: json['SalonId'],
      Doluluk: json['Doluluk'],
      docId: json['docId']);

  Map<String, dynamic> toMap() {
    return {
      'KoltukId': KoltukId,
      'SalonId': SalonId,
      'KoltukNo': KoltukNo,
      'Doluluk': Doluluk,
      'docId': docId
    };
  }
}
