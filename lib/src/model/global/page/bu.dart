import 'package:flutter/cupertino.dart';
import 'package:flutter_rms_app/src/model/OTD/bu.dart';

class BUModel extends ChangeNotifier {
  int init = 0;
  void setInit(int i) {
    init = i;
    notifyListeners();
  }

  int coutMember = 0;
  void setCoutMember(int i) {
    coutMember = i;
    notifyListeners();
  }

  int coutMemberAccept = 0;
  void setCoutMemberAccept(int i) {
    coutMemberAccept = i;
    notifyListeners();
  }

  String dateRequestNew = '';
  void setDateRequestNew(String data) {
    dateRequestNew = data;
    notifyListeners();
  }

  List<BuOTD> listData = [];
  void setListData(List<BuOTD> data) {
    listData = data;
    notifyListeners();
  }

  List<String> listDateShow = [];
  void setListDate(List<String> data) {
    listDateShow = data;
    notifyListeners();
  }

  List<String> listDateYear = [];
  void setListDateYear(List<String> data) {
    listDateYear = data;
    notifyListeners();
  }

  BuOTD detailData = BuOTD();
  void setDetail(BuOTD data) {
    detailData = data;
    notifyListeners();
  }
}
