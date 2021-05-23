import 'dart:convert';

import 'package:flutter/material.dart';

class Sinema {
  final String SinemaId;
  final String SinemaAdi;
  final String Telefon;
  final String Adres;
  final String Bilgi;
  final String resim;
  Sinema({
    @required this.SinemaId,
    this.SinemaAdi,
    this.Telefon,
    this.Adres,
    this.Bilgi,
    this.resim,
  });

  static Sinema fromJson(Map<String, dynamic> json) => Sinema(
      Adres: json['Adres'],
      SinemaAdi: json['SinemaAdi'],
      SinemaId: json['SinemaId'],
      Telefon: json['Telefon'],
      Bilgi: json['Bilgi'],
      resim: json['resim']);

  Map<String, dynamic> toMap() {
    return {
      'Telefon': Telefon,
      'Adres': Adres,
      'SinemaId': SinemaId,
      'SinemaAdi': SinemaAdi,
      'Bilgi': Bilgi,
      'resim': resim
    };
  }
}
