import 'package:flutter/cupertino.dart';

class Kullanici {
  final String KullaniciId;
  final String Adi;

  final String mail;
  Kullanici({
    @required this.KullaniciId,
    this.Adi,
    this.mail,
  });
  static Kullanici fromJson(Map<String, dynamic> json) => Kullanici(
        KullaniciId: json['KullaniciId'],
        Adi: json['Isim'],
        mail: json['Mail'],
      );

  Map<String, dynamic> toMap() {
    return {
      'KullaniciId': KullaniciId,
      'Isim': Adi,
      'Mail': mail,
    };
  }
}
