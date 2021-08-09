import 'dart:convert';

class BUField {
  static String id = 'id';
  static String phongBan = 'Phòng/Ban yêu cầu';
  static String viTri = 'Vị trí';
  static String tieuChi = 'Tiêu chí';
  static String tinhTrang = 'Tình trạng';
  static String phoneList = 'Danh sách ứng viên';
  static String candidateLH = 'Ứng viên đã liên hệ';
  static String candidateDN = 'Ứng viên được nhận';
  static String soLuocYeuCau = 'Sơ lược yêu cầu';
  static String dateTime = 'Datetime';

  static List<String> getFields() => [
        id,
        phongBan,
        viTri,
        tieuChi,
        tinhTrang,
        phoneList,
        soLuocYeuCau,
        dateTime,
      ];
}

class BuOTD {
  String id;
  String phongBan;
  String viTri;
  String tieuChi;
  String tinhTrang;
  List<dynamic> phoneList;
  List<dynamic> candidateLH;
  List<dynamic> candidateDN;
  String soLuocYeuCau;
  String dateTime;

  BuOTD({
    this.dateTime,
    this.id,
    this.phoneList,
    this.phongBan,
    this.soLuocYeuCau,
    this.tieuChi,
    this.tinhTrang,
    this.candidateLH,
    this.candidateDN,
    this.viTri,
  });

  BuOTD.fromJson(Map<String, dynamic> jsonData)
      : id = jsonData[BUField.id],
        phongBan = jsonData[BUField.phongBan],
        viTri = jsonData[BUField.viTri],
        tieuChi = jsonData[BUField.tieuChi],
        tinhTrang = jsonData[BUField.tinhTrang],
        phoneList = json.decode(jsonData[BUField.phoneList]),
        candidateLH = json.decode(jsonData[BUField.candidateLH]),
        candidateDN = json.decode(jsonData[BUField.candidateDN]),
        soLuocYeuCau = jsonData[BUField.soLuocYeuCau],
        dateTime = jsonData[BUField.dateTime];

  Map<String, dynamic> toJson() => {
        BUField.id: id,
        BUField.phongBan: phongBan,
        BUField.viTri: viTri,
        BUField.tieuChi: tieuChi,
        BUField.tinhTrang: tinhTrang,
        BUField.phoneList: json.encode(phoneList),
        BUField.candidateLH: json.encode(candidateLH),
        BUField.candidateDN: json.encode(candidateDN),
        BUField.soLuocYeuCau: soLuocYeuCau,
        BUField.dateTime: dateTime,
      };
}
