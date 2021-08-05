import 'package:flutter/cupertino.dart';
import 'package:flutter_rms_app/src/model/OTD/bu.dart';
import 'package:flutter_rms_app/src/model/OTD/candidate.dart';

class InterViewModel extends ChangeNotifier {
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

  List<CandidateOTD> listCandidate = [];
  void setListCandidate(List<CandidateOTD> value) {
    listCandidate = value;
    notifyListeners();
  }

  List<CandidateOTD> listCandidateDaLH = [];
  void setListCandidateDaLH(List<CandidateOTD> value) {
    listCandidateDaLH = value;
    notifyListeners();
  }
}
