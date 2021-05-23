import 'package:flutter/material.dart';
import 'package:sinemabilet/models/Sinema.dart';
import 'package:sinemabilet/services/firestore_service.dart';

class sinemaProvider with ChangeNotifier {
  List<Sinema> _todos = [];

  List<Sinema> get todos => _todos.toList();

  List<Sinema> get todosCompleted => _todos.toList();

  void setTodos(List<Sinema> todos) =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _todos = todos;
        notifyListeners();
      });
}
