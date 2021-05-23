import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Film {
  final String FilmId;
  final String FilmAdi;
  final String Bilgi;
  final String resim;
  final String Salon;
  Film(
      {@required this.FilmId,
      this.FilmAdi,
      this.Bilgi,
      this.resim,
      this.Salon});

  static Film fromJson(Map<String, dynamic> json) => Film(
        FilmId: json['FilmId'],
        FilmAdi: json['FilmAdi'],
        Bilgi: json['Bilgi'],
        resim: json['resim'],
        Salon: json['Salon'],
      );

  Map<String, dynamic> toMap() {
    return {
      'FilmId': FilmId,
      'FilmAdi': FilmAdi,
      'Bilgi': Bilgi,
      'resim': resim,
      'Salon': Salon
    };
  }
}
