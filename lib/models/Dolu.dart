class Dolu {
  final bool dolu;

  Dolu({this.dolu});

  static Dolu fromJson(Map<String, dynamic> json) =>
      Dolu(dolu: json['Doluluk']);

  Map<String, dynamic> toMap() {
    return {'Doluluk': dolu};
  }
}
