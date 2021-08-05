import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/model/OTD/bu.dart';
import 'package:flutter_rms_app/src/model/OTD/candidate.dart';
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
              SheetAPI.init('Candidate').then((value) => SheetAPI.getAllRow()
                  .then((value) => setListCandidate(value).then((value) => {
                        interViewModel.setListCandidate(value),
                        indexModel.setTitle('Phỏng vấn tuyển dụng'),
                        indexModel.setInitPage(4),
                        indexModel.setInitType(2),
                        Navigator.pop(context),
                      }))),
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

  //=================================================
  Future setListCandidateDaLH(List<dynamic> phone) async {
    List<CandidateOTD> list = [];
    phone.forEach((e) {
      int index = interViewModel.listCandidate
          .indexWhere((element) => element.phone == e);
      if (index > -1) {
        list.add(interViewModel.listCandidate.elementAt(index));
      }
    });
    interViewModel.setListCandidateDaLH(list);
  }
  //=================================================

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
