import 'package:flutter/material.dart';

class CountorProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increaseCount() {
    _count++;
    notifyListeners();
  }
}
