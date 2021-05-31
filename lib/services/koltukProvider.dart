import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:sinemabilet/models/Koltuk.dart';
import 'package:sinemabilet/services/firestore_service.dart';

class koltukProvider with ChangeNotifier {
  final firestoreService = FirestroeService();
  bool _doluluk;
  String _KoltukId;
  String _SalonId;
  String _KoltukNo;
  var uuid = Uuid();

  List<Koltuk> _todos = [];

  List<Koltuk> get todos => _todos.toList();

  List<Koltuk> get todosCompleted => _todos.toList();

  void setTodos(List<Koltuk> todos) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _todos = todos;
        notifyListeners();
      });
  set changeEntry(String entry) {
    _KoltukNo = entry;
    notifyListeners();
  }

  set changeDate(String KoltukId) {
    _KoltukId = KoltukId;
    notifyListeners();
  }
}
