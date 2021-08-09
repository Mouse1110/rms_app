import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/model/OTD/bu.dart';
import 'package:flutter_rms_app/src/model/OTD/candidate.dart';
import 'package:flutter_rms_app/src/model/OTD/interview.dart';
import 'package:flutter_rms_app/src/model/global/index.dart';
import 'package:flutter_rms_app/src/model/global/page/hr.dart';
import 'package:flutter_rms_app/src/utils/sheetapi/index.dart';
import 'package:provider/provider.dart';

class HRController {
  BuildContext context;
  IndexModel indexModel;
  HRModel hrModel;
  HRController({this.context}) {
    indexModel = Provider.of<IndexModel>(context, listen: false);
    hrModel = Provider.of<HRModel>(context, listen: false);
  }

  Future getData() async {
    SheetAPI.init('BU').then((value) =>
        SheetAPI.getAllRow().then((value) => setListBU(value).then((value) => {
              hrModel.setListBU(value),
              SheetAPI.init('Candidate').then((value) => SheetAPI.getAllRow()
                  .then((value) => setListCandidate(value).then((value) => {
                        hrModel.setListCandidate(value),
                        setIndexBU(hrModel.listBU[0]),
                        setListCandidateNew(value, hrModel.listBU).then(
                            (value) => hrModel.setListCandidateNew(value)),
                        //================================
                        indexModel.setTitle('Thông tin ứng viên'),
                        indexModel.setInitPage(3),
                        indexModel.setInitType(3),
                        Navigator.pop(context),
                      })))
            })));
  }

  Future postNewCandidate(String phone) async {
    BuOTD data = hrModel.buIndex;
    data.phoneList.add(phone);
    SheetAPI.init('BU').then((value) =>
        SheetAPI.update(data.toJson(), data.id).then((value) => getData()));
  }

  //===========================================
  Future<int> getID(dynamic value) async {
    if (value == null) return 0;
    int index = int.parse(value['id']);
    return index;
  }

  Future postInterView(int id, String date, String info) async {
    List<CandidateOTD> data = hrModel.listCandidateChuaLH;
    List<Map<String, dynamic>> interView = [];
    data.forEach((element) {
      InterViewOTD json = InterViewOTD();
      json.id = '${++id}';
      json.idBU = hrModel.buIndex.id;
      json.date = date;
      json.thongTin = info;
      json.phone = element.phone;
      interView.add(json.toJson());
    });
    SheetAPI.init('InterView').then((value) => SheetAPI.insert(interView));
  }

  //===========================================
  Future postRemoveCandidateChuaLH(String phone) async {
    BuOTD data = hrModel.buIndex;
    int index = hrModel.listCandidateChuaLH
        .indexWhere((element) => element.phone == phone);
    if (index > -1) {
      hrModel.listCandidateChuaLH.removeAt(index);
    }
    int find = data.phoneList.indexWhere((element) => element == phone);
    if (find > -1) {
      data.phoneList.removeAt(find);
    }
    SheetAPI.init('BU').then((value) => SheetAPI.update(data.toJson(), data.id)
        .then((value) => setListCandidateDaLH()));
  }

  Future<List<String>> parseListPhone() async {
    List<String> lPhone = [];
    hrModel.listCandidateChuaLH.forEach((element) {
      lPhone.add(element.phone);
    });
    return lPhone;
  }

  Future postCandidateDaLH(List<String> phone) async {
    BuOTD data = hrModel.buIndex;
    phone.forEach((phoneItem) {
      data.candidateLH.add(phoneItem);
      hrModel.setListcandidateChuaLH([]);
    });
    SheetAPI.init('BU').then((value) => SheetAPI.update(data.toJson(), data.id)
        .then((value) => setListCandidateDaLH()));
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

  Future<List<CandidateOTD>> setListCandidate(dynamic value) async {
    print(value);
    if (value == null) return [];

    return (value as List).map((e) => CandidateOTD.fromJson(e)).toList();
  }

  Future<List<CandidateOTD>> setListCandidateNew(
      List<CandidateOTD> value, List<BuOTD> listBU) async {
    List<CandidateOTD> list = [];
    value.forEach((element) {
      list.add(element);
    });
    listBU.forEach((element) {
      element.phoneList.forEach((e) {
        int index = list.indexWhere((element) => element.phone == '$e');
        if (index > -1) {
          list.removeAt(index);
        }
      });
    });
    return list;
  }

//=====================================================
  Future setIndexBU(BuOTD value) async {
    hrModel.setBUIndex(value);
  }

  Future setIndexCandidate(CandidateOTD value) async {
    hrModel.setCandidateIndex(value);
  }

  Future setListCandidateDaLH() async {
    List<CandidateOTD> list = [];
    List<CandidateOTD> listCan = hrModel.listCandidate;
    hrModel.buIndex.candidateLH.forEach((e) {
      int index = listCan.indexWhere((element) => e == element.phone);
      if (index > -1) {
        list.add(listCan.elementAt(index));
      }
    });
    hrModel.setListcandidateDaLH(list);
  }

  Future setListCandidateChuaLH() async {
    List<CandidateOTD> list = [];
    List<CandidateOTD> listCan = hrModel.listCandidate;
    List<dynamic> listCanDaLH = hrModel.buIndex.candidateLH;

    hrModel.buIndex.phoneList.forEach((e) {
      int index = listCan.indexWhere((element) => e == element.phone);

      if (index > -1) {
        CandidateOTD can = CandidateOTD();
        can = listCan.elementAt(index);
        int find = listCanDaLH.indexWhere((element) => can.phone == element);

        if (find == -1) {
          list.add(listCan.elementAt(index));
        }
      }
    });
    hrModel.setListcandidateChuaLH(list);
  }

//=====================================================
  void moveDetailPage() {
    indexModel.setInitType(1);
    hrModel.setInit(1);
  }

  void moveListPage() {
    indexModel.setInitType(2);
    hrModel.setInit(2);
  }

  void moveAddPage() {
    indexModel.setInitType(3);
    hrModel.setInit(0);
  }

  void moveAddInfoPage() {
    indexModel.setInitType(3);
    hrModel.setInit(3);
  }
}
