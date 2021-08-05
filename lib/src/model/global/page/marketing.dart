import 'package:flutter/cupertino.dart';
import 'package:flutter_rms_app/src/model/OTD/bu.dart';
import 'package:flutter_rms_app/src/model/OTD/marketing.dart';

import 'package:flutter_rms_app/src/model/OTD/marketingstatus.dart';

class MarketingModel extends ChangeNotifier {
  int init = 0;
  void setInit(int i) {
    init = i;
    notifyListeners();
  }

  List<BuOTD> listBU = [];
  void setListBU(List<BuOTD> value) {
    listBU = value;
    notifyListeners();
  }

  List<MarketingOTD> listMarketing = [];
  void setListMarketing(List<MarketingOTD> value) {
    listMarketing = value;
    notifyListeners();
  }

  List<MarketingOTD> listMarketingFolowMonth = [];
  void setListMarketingFolowMonth(List<MarketingOTD> value) {
    listMarketingFolowMonth = value;
    notifyListeners();
  }

  List<MarketingStatusOTD> listMarketingStatus = [];
  void setListMarketingStatus(List<MarketingStatusOTD> value) {
    listMarketingStatus = value;
    notifyListeners();
  }

  int countBaiViet = 0;
  void setCountBaiViet(int value) {
    countBaiViet = value;
  }

  int countYeuCau = 0;
  void setCountYeuCau(int value) {
    countYeuCau = value;
    notifyListeners();
  }

  int countBaiVietHoatDong = 0;
  void setCountBaiVietHoatDong(int value) {
    countBaiVietHoatDong = value;
    notifyListeners();
  }

  int countBaiVietHetHoatDong = 0;
  void setCountBaiVietHet(int value) {
    countBaiVietHetHoatDong = value;
    notifyListeners();
  }

  int countTongChiPhi = 0;
  void setCountTongChiPhi(int value) {
    countTongChiPhi = value;
  }

  List<String> dateIndex = [];
  void setDateIndex(List<String> value) {
    dateIndex = value;
    notifyListeners();
  }

  int countYeuCauMonth = 0;
  void setCountYeuCauMonth(int value) {
    countYeuCauMonth = value;
    notifyListeners();
  }
}
