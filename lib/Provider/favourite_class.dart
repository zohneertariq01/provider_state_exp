import 'package:flutter/foundation.dart';

class FavouriteClass with ChangeNotifier {
  List<int> _selectedItems = [];
  List<int> get selectedItems => _selectedItems;

  void addFavourite(int index) {
    _selectedItems.add(index);
    notifyListeners();
  }

  void removeFavourite(int index) {
    selectedItems.remove(index);
    notifyListeners();
  }
}
