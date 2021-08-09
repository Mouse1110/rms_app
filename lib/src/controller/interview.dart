import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/model/OTD/bu.dart';
import 'package:flutter_rms_app/src/model/OTD/candidate.dart';
import 'package:flutter_rms_app/src/model/OTD/file.dart';
import 'package:flutter_rms_app/src/model/OTD/interview.dart';
import 'package:flutter_rms_app/src/model/global/index.dart';
import 'package:flutter_rms_app/src/model/global/page/interview.dart';
import 'package:flutter_rms_app/src/utils/sheetapi/index.dart';
import 'package:provider/provider.dart';

class InterViewController {
  BuildContext context;
  IndexModel indexModel;
  InterViewModel interViewModel;
  InterViewController({this.context}) {
    indexModel = Provider.of<IndexModel>(context, listen: false);
    interViewModel = Provider.of<InterViewModel>(context, listen: false);
  }

  Future getData() async {
    SheetAPI.init('BU').then((value) =>
        SheetAPI.getAllRow().then((value) => setListBU(value).then((value) => {
              interViewModel.setListBU(value),
              SheetAPI.init('InterView').then((value) => SheetAPI.getAllRow()
                  .then((value) => setListInterView(value).then((value) => {
                        interViewModel.setListInterView(value),
                        SheetAPI.init('Candidate').then((value) =>
                            SheetAPI.getAllRow().then((value) =>
                                setListCandidate(value).then((value) => {
                                      countCandidateNonUpdate(
                                              interViewModel
                                                  .listBU[0].candidateLH,
                                              interViewModel.listInterView)
                                          .then((value) => interViewModel
                                              .setCountCandidateNonUpdate(
                                                  value)),
                                      interViewModel.setListCandidate(value),
                                      indexModel
                                          .setTitle('Phỏng vấn tuyển dụng'),
                                      indexModel.setInitPage(4),
                                      indexModel.setInitType(2),
                                      Navigator.pop(context),
                                    }))),
                      })))
            })));
  }

  Future<List<CandidateOTD>> setListCandidate(dynamic value) async {
    if (value == null) return [];
    return (value as List).map((e) => CandidateOTD.fromJson(e)).toList();
  }

  Future<List<BuOTD>> setListBU(dynamic value) async {
    if (value == null) return [];
    List<BuOTD> list = [];
    (value as List).forEach((element) {
      if (element['Tình trạng'] == 'in') {
        list.add(BuOTD.fromJson(element));
      }
    });
    return list;
  }

  Future<List<InterViewOTD>> setListInterView(dynamic value) async {
    if (value == null) return [];
    return (value as List).map((e) => InterViewOTD.fromJson(e)).toList();
  }

  //=================================================
  Future setListCandidateDaLH(List<dynamic> phone) async {
    List<CandidateOTD> list = [];
    phone.forEach((e) {
      int index = interViewModel.listCandidate
          .lastIndexWhere((element) => element.phone == e);
      if (index > -1) {
        list.add(interViewModel.listCandidate.elementAt(index));
      }
    });
    interViewModel.setListCandidateDaLH(list);
  }

  Future setListCandidateUpdate(BuOTD buIndex) async {
    List<CandidateOTD> data = interViewModel.listCandidateDaLH;
    print(data.length);
    List<CandidateUpdateOTD> list = [];
    data.forEach((element) {
      int index = buIndex.candidateDN
          .indexWhere((itemPhone) => itemPhone == element.phone);
      CandidateUpdateOTD data = CandidateUpdateOTD(element);
      if (index == -1) {
        data.isUpdate = false;
      } else {
        data.isUpdate = true;
      }

      list.add(data);
    });
    interViewModel.setListCandidateUpdate(list);
  }

  //=================================================

  Future<int> countCandidateNonUpdate(
      List<dynamic> phone, List<InterViewOTD> listInterView) async {
    if (listInterView == [] || phone == []) return 0;
    int count = 0;
    phone.forEach((itemPhone) {
      InterViewOTD data =
          listInterView.lastWhere((item) => item.phone == itemPhone);
      if (data != null) {
        if (data.ketLuan == '') {
          count++;
        }
      }
    });
    return count;
  }

  Future setCandidateIndex(CandidateUpdateOTD value) async {
    interViewModel.setCandidateIndex(value);
  }
  // AddPage ===================================

  Future postDataInterView(
      {InterViewOTD interViewInput, FileOTD fileInput, bool isKetLuan}) async {
    CandidateUpdateOTD candidate = interViewModel.candidateIndex;
    int index = interViewModel.listInterView
        .indexWhere((element) => element.phone == candidate.phone);
    if (index > -1) {
      InterViewOTD interView = interViewModel.listInterView.elementAt(index);
      interView.phongVan = interViewInput.phongVan;
      interView.nhanXet = interViewInput.nhanXet;
      interView.ketLuan = interViewInput.ketLuan;
      interViewModel.setInterViewIndex(interView);
      FileOTD file = FileOTD();
      if (isKetLuan) {
        file.id = interView.id;
        file.idBU = interView.idBU;
        file.phone = candidate.phone;
        file.name = candidate.name;
        file.email = candidate.email;
        file.image = candidate.image;
        file.timeStart = fileInput.timeStart;
        file.scan = fileInput.scan;
        file.nganHang = fileInput.nganHang;
        file.soTaiKhoan = fileInput.soTaiKhoan;
        interViewModel.setFileIndex(file);
      }
      interViewModel.buIndex.candidateDN.add(candidate.phone);
      SheetAPI.init('BU')
          .then((value) => SheetAPI.update(
              interViewModel.buIndex.toJson(), interViewModel.buIndex.id))
          .then((value) => SheetAPI.init('InterView').then((value) =>
              SheetAPI.update(interView.toJson(), interView.id).then((_) {
                if (isKetLuan) {
                  SheetAPI.init('File').then((value) =>
                      SheetAPI.insert([file.toJson()]).then((value) =>
                          {moveDetailPage(), Navigator.pop(context)}));
                }
              })));
    }
  }
  //====================================================

  Future getDataBeforMoveListpage() async {
    moveListPage();
    getData();
  }

  //====================================================
  void moveDetailPage() {
    indexModel.setInitType(1);
    interViewModel.setInit(2);
  }

  void moveListPage() {
    indexModel.setInitType(2);
    interViewModel.setInit(0);
  }

  void moveAddPage() {
    indexModel.setInitType(3);
    interViewModel.setInit(1);
  }
}
