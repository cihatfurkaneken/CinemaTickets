import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sinemabilet/models/Bilet.dart';
import 'package:sinemabilet/models/Dolu.dart';
import 'package:sinemabilet/models/Film.dart';
import 'package:sinemabilet/models/Koltuk.dart';
import 'package:sinemabilet/models/Kullanici.dart';
import 'package:sinemabilet/models/Sinema.dart';

class FirestroeService {
//FİREBASE'DEN FİLMLERİ OKUYUP SINIFLARA ATILMASI BACK-END KODLARI
  static Stream<List<Film>> readFilms() => FirebaseFirestore.instance
      .collection('Film')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Film.fromJson(doc.data())).toList());

//FİREBASE'DEN KOLTUKLARI OKUYUP SINIFLARA ATILMASI BACK-END KODLARI
  static Stream<List<Koltuk>> readKoltuk(String SalonId) =>
      FirebaseFirestore.instance
          .collection('Koltuk')
          .where('SalonId',
              isEqualTo: SalonId) // SEÇİLEN FİLMİN SALONLARINA GÖRE GETİRİYOR
          .orderBy('KoltukNo') //KOLTUK NO'SUNA GÖRE SIRALA
          .snapshots()
          .map((snapshot) =>
              snapshot.docs.map((doc) => Koltuk.fromJson(doc.data())).toList());

//FİREBASE'DEN KOLTUKLARIN DOLU OLUP OLMADIĞININ SINIFLARA ATILMASI BACK-END KODLARI
  static Stream<List<Dolu>> readDolu(String KoltukId, String tarih) =>
      FirebaseFirestore.instance
          .collection('Koltuk')
          .doc(KoltukId)
          .collection('Tarih')
          .doc(tarih)
          .collection('Seans')
          .snapshots()
          .map((snapshot) =>
              snapshot.docs.map((doc) => Dolu.fromJson(doc.data())).toList());

//FİREBASE'DEN BİLETLERİN OKUNUP SINIFLARA ATILMASI BACK-END KODLARI
  static Stream<List<Bilet>> readBilet(String uid) => FirebaseFirestore.instance
      .collection('Bilet')
      .where('uid',
          isEqualTo: uid) // GİRİŞ YAPAN KULLANICININ BİLETLERİNİ GETİR
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Bilet.fromJson(doc.data())).toList());

//FİREBASE'DEN KULLANICININ BİLGİLERİNİN OKUNUP SINIFLARA ATILMASI BACK-END KODLARI
  static Stream<List<Kullanici>> readKullanici(String uid) => FirebaseFirestore
      .instance
      .collection('Kullanicilar')
      .where('KullaniciId',
          isEqualTo: uid) // GİRİŞ YAPAN KULLANICININ BİLETLERİNİ GETİR
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Kullanici.fromJson(doc.data())).toList());

//BİLET BAŞARIYLA ALINIRSA BİLET OLUŞTURMA BACK-END KDLARI,
// DAHA SONRA OKUMAK ÜZERE FİREBASE'E BİLET BİLGİLERİNİ EKLİYOR
  static Future<void> addItem({
    String userUid,
    String seans,
    String tarih,
    String biletId,
    String filmId,
    List<String> koltuk,
    String salon,
  }) async {
    DocumentReference documentReferencer =
        FirebaseFirestore.instance.collection('Bilet').doc();
    Map<String, dynamic> data = <String, dynamic>{
      "BiletId": biletId,
      "Seans": seans,
      "Tarih": tarih,
      "FilmId": filmId,
      "uid": userUid,
      "Koltuk": koltuk,
      "Salon": salon
    };
    await documentReferencer
        .set(data)
        .whenComplete(() => print("Bilet Eklendi"))
        .catchError((e) => print(e));
  }
}
