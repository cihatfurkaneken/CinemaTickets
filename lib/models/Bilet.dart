class Bilet {
  final String filmId;
  final String seans;
  final String tarih;
  final String salon;
  final String uid;
  final List koltuk;
  Bilet(
      {this.filmId, this.seans, this.tarih, this.uid, this.koltuk, this.salon});

  static Bilet fromJson(Map<String, dynamic> json) => Bilet(
      filmId: json['FilmId'],
      seans: json['Seans'],
      tarih: json['Tarih'],
      uid: json['uid'],
      koltuk: json['Koltuk'],
      salon: json['Salon']);

  Map<String, dynamic> toMap() {
    return {
      'FilmId': filmId,
      'Seans': seans,
      'Tarih': tarih,
      'uid': uid,
      'Koltuk': koltuk,
      'Salon': salon
    };
  }
}
