import 'package:flutter/cupertino.dart';
import 'package:flutter_rms_app/src/model/OTD/bu.dart';
import 'package:flutter_rms_app/src/model/OTD/candidate.dart';

class HRModel extends ChangeNotifier {
  int init = 0;
  void setInit(int i) {
    init = i;
    notifyListeners();
  }

  List<CandidateOTD> listCandidate = [];
  void setListCandidate(List<CandidateOTD> value) {
    listCandidate = value;
    notifyListeners();
  }

  List<BuOTD> listBU = [];
  void setListBU(List<BuOTD> value) {
    listBU = value;
    notifyListeners();
  }

  List<CandidateOTD> listCandidateNew = [];
  void setListCandidateNew(List<CandidateOTD> value) {
    listCandidateNew = value;
    notifyListeners();
  }

  CandidateOTD candidateIndex = CandidateOTD();
  void setCandidateIndex(CandidateOTD value) {
    candidateIndex = value;
    notifyListeners();
  }

  BuOTD buIndex = BuOTD();
  void setBUIndex(BuOTD value) {
    buIndex = value;
    notifyListeners();
  }

  List<CandidateOTD> listCandidateDaLH = [];
  void setListcandidateDaLH(List<CandidateOTD> value) {
    listCandidateDaLH = value;
    notifyListeners();
  }

  List<CandidateOTD> listCandidateChuaLH = [];
  void setListcandidateChuaLH(List<CandidateOTD> value) {
    listCandidateChuaLH = value;
    notifyListeners();
  }
}
