import 'dart:core';
import 'package:flutter/foundation.dart';

class VisibilityClass with ChangeNotifier {
  bool _visibility = true;
  bool get visibility => _visibility;

  void joggleVisibility() {
    _visibility = !visibility;
    notifyListeners();
  }
}
