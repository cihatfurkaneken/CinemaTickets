import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Kullanici {
  final int KullaniciId;
  final String KullaniciAdi;
  final String Sifre;
  final String Adi;
  final String Soyadi;
  final String Telefon;
  Kullanici({
    @required this.KullaniciId,
    this.KullaniciAdi,
    this.Sifre,
    this.Adi,
    this.Soyadi,
    this.Telefon,
  });

  Map<String, dynamic> toMap() {
    return {
      'KullaniciId': KullaniciId,
      'KullaniciAdi': KullaniciAdi,
      'Sifre': Sifre,
      'Adi': Adi,
      'Soyadi': Soyadi,
      'Telefon': Telefon,
    };
  }

  factory Kullanici.fromMap(Map<String, dynamic> map) {
    return Kullanici(
      KullaniciId: map['KullaniciId'],
      KullaniciAdi: map['KullaniciAdi'],
      Sifre: map['Sifre'],
      Adi: map['Adi'],
      Soyadi: map['Soyadi'],
      Telefon: map['Telefon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Kullanici.fromJson(String source) =>
      Kullanici.fromMap(json.decode(source));
}
