import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Salon {
  final int SalonId;
  final String SalonNo;
  Salon({
    @required this.SalonId,
    this.SalonNo,
  });

  Map<String, dynamic> toMap() {
    return {
      'SalonId': SalonId,
      'SalonNo': SalonNo,
    };
  }

  factory Salon.fromMap(Map<String, dynamic> map) {
    return Salon(
      SalonId: map['SalonId'],
      SalonNo: map['SalonNo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Salon.fromJson(String source) => Salon.fromMap(json.decode(source));
}
