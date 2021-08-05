import 'marketing.dart';

class MarketingStatusOTD {
  String id;
  String kenhDangTuyen;
  String tenBai;
  String timeStart;
  String timeEnd;
  String minhChung;
  String chiPhi;
  String idBU;
  String status;
  String dateTime;

  MarketingStatusOTD({
    this.dateTime,
    this.id,
    this.chiPhi,
    this.idBU,
    this.kenhDangTuyen,
    this.minhChung,
    this.tenBai,
    this.status,
    this.timeEnd,
    this.timeStart,
  });

  MarketingStatusOTD.fromJson(Map<String, dynamic> jsonData)
      : id = jsonData[MarketingField.id],
        kenhDangTuyen = jsonData[MarketingField.kenhDangTuyen],
        tenBai = jsonData[MarketingField.tenBai],
        timeStart = jsonData[MarketingField.timeStart],
        timeEnd = jsonData[MarketingField.timeEnd],
        minhChung = jsonData[MarketingField.minhChung],
        chiPhi = jsonData[MarketingField.chiPhi],
        idBU = jsonData[MarketingField.idBU],
        dateTime = jsonData[MarketingField.dateTime];

  Map<String, dynamic> toJson() => {
        MarketingField.id: id,
        MarketingField.kenhDangTuyen: kenhDangTuyen,
        MarketingField.tenBai: tenBai,
        MarketingField.timeStart: timeStart,
        MarketingField.timeEnd: timeEnd,
        MarketingField.minhChung: minhChung,
        MarketingField.chiPhi: chiPhi,
        MarketingField.idBU: idBU,
        MarketingField.dateTime: dateTime,
      };
}
