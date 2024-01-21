import 'package:flutter/foundation.dart';

class ProviderClass1 with ChangeNotifier {
  double _sliderValue = 1.0;
  double get sliderValue => _sliderValue;

  void onChange(double val) {
    _sliderValue = val;
    notifyListeners();
  }
}
