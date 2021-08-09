import 'package:flutter/cupertino.dart';
import 'package:flutter_rms_app/src/model/OTD/bu.dart';
import 'package:flutter_rms_app/src/model/OTD/candidate.dart';
import 'package:flutter_rms_app/src/model/OTD/file.dart';
import 'package:flutter_rms_app/src/model/OTD/interview.dart';

// MODEL =================
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

  BuOTD buIndex;
  void setBuIndex(BuOTD value) {
    buIndex = value;
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

  List<InterViewOTD> listInterView = [];
  void setListInterView(List<InterViewOTD> value) {
    listInterView = value;
    notifyListeners();
  }

  List<FileOTD> listFile = [];
  void setListFile(List<FileOTD> value) {
    listFile = value;
    notifyListeners();
  }

  // Show on page list
  int countCandidateNonUpdate = 0;
  void setCountCandidateNonUpdate(int value) {
    countCandidateNonUpdate = value;
    notifyListeners();
  }

  List<CandidateUpdateOTD> listCandidateUpdate = [];
  void setListCandidateUpdate(List<CandidateUpdateOTD> value) {
    listCandidateUpdate = value;
    notifyListeners();
  }

  CandidateUpdateOTD candidateIndex;
  void setCandidateIndex(CandidateUpdateOTD value) {
    candidateIndex = value;
    notifyListeners();
  }
  //===========================

  InterViewOTD interViewIndex;
  void setInterViewIndex(InterViewOTD value) {
    interViewIndex = value;
    notifyListeners();
  }

  FileOTD fileIndex;
  void setFileIndex(FileOTD value) {
    fileIndex = value;
    notifyListeners();
  }
}
