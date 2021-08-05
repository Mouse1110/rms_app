import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/model/OTD/bu.dart';
import 'package:flutter_rms_app/src/model/OTD/marketing.dart';
import 'package:flutter_rms_app/src/model/OTD/marketingstatus.dart';
import 'package:flutter_rms_app/src/model/global/index.dart';
import 'package:flutter_rms_app/src/model/global/page/marketing.dart';
import 'package:flutter_rms_app/src/utils/sheetapi/index.dart';
import 'package:provider/provider.dart';

class MarketingController {
  BuildContext context;
  IndexModel indexModel;
  MarketingModel marketingModel;
  MarketingController({this.context}) {
    indexModel = Provider.of<IndexModel>(context, listen: false);
    marketingModel = Provider.of<MarketingModel>(context, listen: false);
  }

  Future getData() async {
    SheetAPI.init('BU').then((value) => SheetAPI.getAllRow().then((value) => {
          setListBU(value).then((value) => marketingModel.setListBU(value)),
          SheetAPI.init('Marketing').then((value) => SheetAPI.getAllRow()
              .then((value) => setListMarketing(value).then((value) => {
                    marketingModel.setListMarketing(value),
                    parseListMarketing(value, marketingModel.listBU)
                        .then((value) => {
                              marketingModel.setListMarketingStatus(value),
                              marketingModel.setCountBaiViet(value.length),
                              countYeuCau(value).then((value) =>
                                  marketingModel.setCountYeuCau(value)),
                              countBaiVietHD(value).then((value) => {
                                    marketingModel
                                        .setCountBaiVietHoatDong(value),
                                    marketingModel.setCountBaiVietHet(
                                        marketingModel
                                                .listMarketingStatus.length -
                                            value),
                                    setListMarketingFolowMonth()
                                        .then((value) => {
                                              marketingModel
                                                  .setListMarketingFolowMonth(
                                                      value),
                                              countYeuCauMonth(value).then(
                                                  (value) => marketingModel
                                                      .setCountYeuCauMonth(
                                                          value))
                                            }),
                                    marketingModel.setDateIndex(marketingModel
                                        .listMarketing
                                        .elementAt(marketingModel
                                                .listMarketing.length -
                                            1)
                                        .dateTime
                                        .split('/'))
                                  }),
                              countTongChiPhi(value).then((value) =>
                                  marketingModel.setCountTongChiPhi(value)),
                              indexModel.setTitle('Bài viết tuyển dụng'),
                              indexModel.setInitPage(2),
                              indexModel.setInitType(2),
                              Navigator.pop(context),
                            })
                  })))
        }));
  }

  Future<List<BuOTD>> setListBU(dynamic value) async {
    if (value == null) return [];
    return (value as List).map((e) => BuOTD.fromJson(e)).toList();
  }

  Future<List<MarketingOTD>> setListMarketing(dynamic value) async {
    if (value == null) return [];
    return (value as List).map((e) => MarketingOTD.fromJson(e)).toList();
  }

  Future<List<MarketingStatusOTD>> parseListMarketing(
      List<MarketingOTD> value, List<BuOTD> lBU) async {
    if (value == []) return [];
    List<MarketingStatusOTD> list = [];
    value.forEach((e) {
      int index = lBU.indexWhere((element) => element.id == e.idBU);
      String status = '';
      if (index > -1) {
        status = lBU.elementAt(index).tinhTrang;
      }
      MarketingStatusOTD data = MarketingStatusOTD(
        chiPhi: e.chiPhi,
        id: e.id,
        dateTime: e.dateTime,
        idBU: e.idBU,
        kenhDangTuyen: e.kenhDangTuyen,
        minhChung: e.minhChung,
        tenBai: e.tenBai,
        status: status,
        timeEnd: e.timeEnd,
        timeStart: e.timeStart,
      );
      list.add(data);
    });
    return list;
  }

  ///=========================================
  /// Count
  /// =======================================

  Future<int> countYeuCau(List<MarketingStatusOTD> value) async {
    if (value == []) return 0;
    String index = '';
    int count = 0;

    value.forEach((element) {
      if (index != element.idBU) {
        count++;
        index = element.idBU;
      }
    });

    return count;
  }

  Future<int> countBaiVietHD(List<MarketingStatusOTD> value) async {
    if (value == []) return 0;
    int count = 0;
    value.forEach((element) {
      if (element.status == 'in') {
        count++;
      }
    });
    return count;
  }

  Future<int> countTongChiPhi(List<MarketingStatusOTD> value) async {
    if (value == []) return 0;
    int count = 0;
    value.forEach((element) {
      count += int.parse(element.chiPhi);
    });
    return count;
  }

  //=========================================================================
  Future<List<MarketingOTD>> setListMarketingFolowMonth() async {
    List<MarketingOTD> list = [];
    List<String> date = marketingModel.listMarketing
        .elementAt(marketingModel.listMarketing.length - 1)
        .dateTime
        .split('/');
    marketingModel.listMarketing.forEach((element) {
      if (element.dateTime.split('/')[1] == date[1] &&
          element.dateTime.split('/')[2] == date[2]) {
        list.add(element);
      }
    });
    return list;
  }

  Future<int> countYeuCauMonth(List<MarketingOTD> value) async {
    if (value == []) return 0;
    String id = '';
    int count = 0;
    value.forEach((element) {
      if (element.idBU != id) {
        count++;
        id = element.idBU;
      }
    });
    return count;
  }

  Future refeshList(bool isNext) async {
    String date =
        '${marketingModel.dateIndex[0]}/${marketingModel.dateIndex[1]}/${marketingModel.dateIndex[2]}';
    if (!isNext) {
      int index = marketingModel.listMarketing
          .lastIndexWhere((element) => element.dateTime == date);
      print(index);
      for (int i = index - 1; i >= 0; i--) {
        if (marketingModel.listMarketing[i].dateTime.split('/')[1] !=
                marketingModel.dateIndex[1] ||
            marketingModel.listMarketing[i].dateTime.split('/')[2] !=
                marketingModel.dateIndex[2]) {
          marketingModel.setDateIndex(
              marketingModel.listMarketing.elementAt(i).dateTime.split('/'));
          break;
        }
      }
    } else {
      int index = marketingModel.listMarketing
          .indexWhere((element) => element.dateTime == date);
      for (int i = index + 1;
          i < marketingModel.listMarketing.length - 1;
          i++) {
        if (marketingModel.listMarketing[i].dateTime.split('/')[1] !=
                marketingModel.dateIndex[1] ||
            marketingModel.listMarketing[i].dateTime.split('/')[2] !=
                marketingModel.dateIndex[2]) {
          marketingModel.setDateIndex(
              marketingModel.listMarketing.elementAt(i).dateTime.split('/'));
          break;
        }
      }
    }

    List<MarketingOTD> list = [];
    marketingModel.listMarketing.forEach((element) {
      if (element.dateTime.split('/')[1] == marketingModel.dateIndex[1] &&
          element.dateTime.split('/')[2] == marketingModel.dateIndex[2]) {
        list.add(element);
      }
    });
    countYeuCauMonth(list)
        .then((value) => marketingModel.setCountYeuCauMonth(value));
    marketingModel.setListMarketingFolowMonth(list);
  }

  List<String> getIDBU(List<BuOTD> value) {
    if (value == []) return [];
    List<String> list = [];
    value.forEach((element) {
      if (element.tinhTrang == 'in') {
        list.add('${element.id}-${element.phongBan}/${element.viTri}');
      }
    });
    return list;
  }

  //===========================================

  void postData(MarketingOTD data) {
    SheetAPI.init('Marketing').then((value) =>
        SheetAPI.getLastRow().then((value) => getID(value).then((value) => {
              data.id = value,
              SheetAPI.insert([data.toJson()]).then((value) => moveListPage())
            })));
  }

  Future<String> getID(dynamic value) async {
    if (value == null) return '0';
    int id = int.parse(value['id']) + 1;
    return '${id + 1}';
  }

//=====================
  void moveListPage() {
    indexModel.setInitType(2);
    marketingModel.setInit(0);
  }

  void moveAddPage() {
    indexModel.setInitType(3);
    marketingModel.setInit(1);
  }
}
