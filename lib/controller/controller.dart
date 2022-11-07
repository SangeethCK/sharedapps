import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User extends ChangeNotifier {
  String email = '';
  String password = '';

  void sigIn(String email, String password)async {
    late SharedPreferences logindata;
    late bool newuser;
        logindata = await SharedPreferences.getInstance();
    email = email;
    password = password;
    notifyListeners();
  }
}
