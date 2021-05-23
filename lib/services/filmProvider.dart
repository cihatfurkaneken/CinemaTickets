import 'package:flutter/material.dart';
import 'package:sinemabilet/models/Film.dart';
import 'package:sinemabilet/services/firestore_service.dart';

class filmProvider with ChangeNotifier {
  List<Film> _todos = [];

  List<Film> get todos => _todos.toList();

  List<Film> get todosCompleted => _todos.toList();

  void setTodos(List<Film> todos) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _todos = todos;
        notifyListeners();
      });
}
