import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sinemabilet/models/Film.dart';
import 'package:sinemabilet/models/Koltuk.dart';
import 'package:sinemabilet/models/Sinema.dart';
import 'package:sinemabilet/services/Utils.dart';

class FirestroeService {
  static Stream<List<Sinema>> readTodos() => FirebaseFirestore.instance
      .collection('Sinema')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Sinema.fromJson(doc.data())).toList());

  static Stream<List<Film>> readFilms() => FirebaseFirestore.instance
      .collection('Film')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Film.fromJson(doc.data())).toList());

  static Stream<List<Koltuk>> readKoltuk(String SalonId) =>
      FirebaseFirestore.instance
          .collection('Koltuk')
          .where('SalonId', isEqualTo: SalonId)
          .orderBy('KoltukNo')
          .snapshots()
          .map((snapshot) =>
              snapshot.docs.map((doc) => Koltuk.fromJson(doc.data())).toList());

  Future<void> setEntry(Koltuk entry) {
    var options = SetOptions(merge: true);

    return FirebaseFirestore.instance
        .collection('Koltuk')
        .doc(entry.KoltukId)
        .set(entry.toMap(), options);
  }
}
