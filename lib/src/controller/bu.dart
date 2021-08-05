import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/model/OTD/bu.dart';
import 'package:flutter_rms_app/src/model/global/index.dart';
import 'package:flutter_rms_app/src/model/global/page/bu.dart';
import 'package:flutter_rms_app/src/utils/sheetapi/index.dart';
import 'package:provider/provider.dart';

class BUController {
  BuildContext context;
  BUModel buModel;
  IndexModel indexModel;
  BUController({this.context}) {
    buModel = Provider.of<BUModel>(context, listen: false);
    indexModel = Provider.of<IndexModel>(context, listen: false);
  }

  Future getData() async {
    SheetAPI.init('BU').then((value) =>
        SheetAPI.getAllRow().then((value) => mapData(value).then((value) => {
              buModel.setListData(value),
              getDateNew(value)
                  .then((value) => buModel.setDateRequestNew(value)),
              getMemberAccept(value)
                  .then((value) => buModel.setCoutMemberAccept(value)),
              getDate(value).then((value) => buModel.setListDate(value)),
              getDateYear(value)
                  .then((value) => buModel.setListDateYear(value)),
              setMember(value).then((value) => buModel.setCoutMember(value)),
              indexModel.setTitle('Yêu cầu tuyển dụng'),
              indexModel.setInitPage(1),
              indexModel.setInitType(2),
              Navigator.pop(context),
            })));
  }

  Future<int> getMemberAccept(List<BuOTD> value) async {
    if (value == []) return 0;
    int count = 0;
    value.forEach((element) {
      count += element.candidateLH.length;
    });
    return count;
  }

  Future<List<String>> getDate(List<BuOTD> value) async {
    if (value == []) return [];
    List<String> date = [];
    value.forEach((element) {
      if (element.dateTime.split('/').length == 3) {
        date.add(
            '${element.dateTime.split('/')[0]}/${element.dateTime.split('/')[1]}');
      } else {
        date.add('');
      }
    });
    return date;
  }

  Future<List<String>> getDateYear(List<BuOTD> value) async {
    if (value == []) return [];
    List<String> date = [];
    String indexYear = '';
    value.forEach((element) {
      if (element.dateTime.split('/').length == 3) {
        if (indexYear != element.dateTime.split('/')[2]) {
          date.add(element.dateTime.split('/')[2]);
          indexYear = element.dateTime.split('/')[2];
        } else {
          date.add('');
        }
      } else {
        date.add('');
      }
    });
    return date;
  }

  Future<List<BuOTD>> mapData(dynamic value) async {
    if (value == null) return [];
    List<BuOTD> data = (value as List).map((e) => BuOTD.fromJson(e)).toList();
    return data;
  }

  Future<int> setMember(List<BuOTD> value) async {
    if (value == []) return 0;
    int count = 0;
    value.forEach((element) {
      count += element.phoneList.length;
    });
    return count;
  }

  Future<String> getDateNew(List<BuOTD> value) async {
    if (value == []) return '';

    List<String> dateGet = value[value.length - 1].dateTime.split('/');
    String date = 'Ngày ' + dateGet[0] + ' Tháng ' + dateGet[1] + ' Năm 2021';
    return date;
  }

  ///====================================
  /// Detail
  /// =================================

  Future saveModelDetail(BuOTD data) async {
    buModel.setDetail(data);
  }

  /// ======================================
  /// Add
  /// ====================================

  Future postData(BuOTD data) async {
    SheetAPI.init('BU').then((value) => SheetAPI.getLastRow().then((value) =>
        convertID(value).then((value) => addIDandDate(value, data).then(
            (value) => SheetAPI.insert([value.toJson()])
                .then((value) => {moveListPage(), Navigator.pop(context)})))));
  }

  Future<String> convertID(dynamic value) async {
    if (value == null) return '1';
    int id = 0;
    id = int.parse(value['id']);
    return '${id + 1}';
  }

  Future<BuOTD> addIDandDate(String id, BuOTD data) async {
    DateTime time = DateTime.now();
    String parseTime = '${time.day}/${time.month}/${time.year}';
    data.id = id;
    data.dateTime = parseTime;
    return data;
  }

  void moveDetailPage() {
    indexModel.setInitType(1);
    buModel.setInit(1);
  }

  void moveListPage() {
    indexModel.setInitType(2);
    buModel.setInit(0);
  }

  void moveAddPage() {
    indexModel.setInitType(3);
    buModel.setInit(2);
  }
}
