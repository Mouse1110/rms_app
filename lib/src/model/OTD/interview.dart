class InterViewField {
  static String id = 'id';
  static String idBU = 'idBU';
  static String phone = 'Phone';
  static String phongVan = 'Phỏng vấn';
  static String nhanXet = 'Nhận xét CV';
  static String date = 'Ngày phỏng vấn';
  static String thongTin = 'Thông tin phỏng vấn';
  static String ketLuan = 'Kết luận';

  static List<String> getFields() => [
        id,
        idBU,
        phone,
        phongVan,
        nhanXet,
        date,
        thongTin,
        ketLuan,
      ];
}

class InterViewOTD {
  String id;
  String idBU;
  String phone;
  String phongVan;
  String nhanXet;
  String date;
  String thongTin;
  String ketLuan;

  InterViewOTD(
      {this.date,
      this.id,
      this.idBU,
      this.ketLuan,
      this.nhanXet,
      this.phone,
      this.phongVan,
      this.thongTin});

  InterViewOTD.fromJson(Map<String, dynamic> jsonData)
      : id = jsonData[InterViewField.id],
        idBU = jsonData[InterViewField.idBU],
        phone = jsonData[InterViewField.phone],
        phongVan = jsonData[InterViewField.phongVan],
        nhanXet = jsonData[InterViewField.nhanXet],
        date = jsonData[InterViewField.date],
        thongTin = jsonData[InterViewField.thongTin],
        ketLuan = jsonData[InterViewField.ketLuan];

  Map<String, dynamic> toJson() => {
        InterViewField.id: id,
        InterViewField.idBU: idBU,
        InterViewField.phone: '$phone',
        InterViewField.phongVan: phongVan,
        InterViewField.nhanXet: nhanXet,
        InterViewField.date: date,
        InterViewField.thongTin: thongTin,
        InterViewField.ketLuan: ketLuan,
      };
}
