import 'package:flutter/material.dart';

class IndexModel extends ChangeNotifier {
  int initScreen = 0;
  void setInitScreen(int i) {
    initScreen = i;
    notifyListeners();
  }

  int initPage = 0;
  void setInitPage(int i) {
    initPage = i;
    notifyListeners();
  }

  int initType = 0;
  void setInitType(int i) {
    initType = i;
    notifyListeners();
  }

  String title = '';
  void setTitle(String str) {
    title = str;
    notifyListeners();
  }
}
