import 'package:flutter/material.dart';

class RegisterPageModel with ChangeNotifier {
  int current = 0;
  setCurrent(index) {
    this.current = 1;
    notifyListeners();
  }
}
