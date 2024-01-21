import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class LoginClass with ChangeNotifier {
  bool _visibility = true;
  bool get visibility => _visibility;

  void joggleVisibility() {
    _visibility = !_visibility;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;

  void loadIndicator(value) {
    _loading = value;
    notifyListeners();
  }

  void loginPage(String email, String password) async {
    loadIndicator(true);
    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        print('Successful');
        loadIndicator(false);
      } else {
        print('Failed to load');
        loadIndicator(false);
      }
    } catch (e) {
      print(e.toString());
      loadIndicator(false);
    }
  }
}
