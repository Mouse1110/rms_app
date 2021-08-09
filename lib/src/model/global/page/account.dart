import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountModel extends ChangeNotifier {
  GoogleSignInAccount user;
  void setUser(GoogleSignInAccount value) {
    user = value;
    notifyListeners();
  }
}
