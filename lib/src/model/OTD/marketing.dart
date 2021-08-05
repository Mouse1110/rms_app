class MarketingField {
  static String id = 'id';
  static String kenhDangTuyen = 'kênh đăng tuyển';
  static String tenBai = 'tên bài';
  static String timeStart = 'thời gian bắt đầu';
  static String timeEnd = 'thời gian kết thúc';
  static String minhChung = 'minh chứng';
  static String chiPhi = 'chi phí';
  static String idBU = 'idBU';
  static String dateTime = 'datetime';

  static List<String> getFields() => [
        id,
        kenhDangTuyen,
        tenBai,
        timeStart,
        timeEnd,
        minhChung,
        chiPhi,
        idBU,
        dateTime
      ];
}

class MarketingOTD {
  String id;
  String kenhDangTuyen;
  String tenBai;
  String timeStart;
  String timeEnd;
  String minhChung;
  String chiPhi;
  String idBU;
  String dateTime;

  MarketingOTD({
    this.dateTime,
    this.id,
    this.chiPhi,
    this.idBU,
    this.kenhDangTuyen,
    this.minhChung,
    this.tenBai,
    this.timeEnd,
    this.timeStart,
  });

  MarketingOTD.fromJson(Map<String, dynamic> jsonData)
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
