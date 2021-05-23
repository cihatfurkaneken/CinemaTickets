import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Vizyon {
  final String VizyonId;
  final String Tarih;
  final String FilmId;
  final String SalonId;
  Vizyon({
    @required this.VizyonId,
    this.Tarih,
    this.FilmId,
    this.SalonId,
  });

  Map<String, dynamic> toMap() {
    return {
      'VizyonId': VizyonId,
      'Tarih': Tarih,
      'FilmId': FilmId,
      'SalonId': SalonId,
    };
  }

  factory Vizyon.fromMap(Map<String, dynamic> map) {
    return Vizyon(
      VizyonId: map['VizyonId'],
      Tarih: map['Tarih'],
      FilmId: map['FilmId'],
      SalonId: map['SalonId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Vizyon.fromJson(String source) => Vizyon.fromMap(json.decode(source));
}
