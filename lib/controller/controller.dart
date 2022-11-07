import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  String email = '';
  String password = '';

  void sigIn(String email, String password) {
    email = email;
    password = password;
    notifyListeners();
  }
}
