import 'package:flutter/foundation.dart';

class ProviderClass with ChangeNotifier {
  int _counter = 6;
  int get counter => _counter;

  void addCounter() {
    _counter++;
    notifyListeners();
  }
}
