class FileField {
  static String id = 'idInterView';
  static String idBU = 'idBU';
  static String phone = 'Số Điện thoại';
  static String name = 'Tên';
  static String email = 'Email';
  static String image = 'Image';
  static String timeStart = 'Thời gian bắt đầu';
  static String scan = 'Scan hồ sơ';
  static String nganHang = 'Ngân hàng';
  static String soTaiKhoan = 'Số tài khoản';

  static List<String> getFields() => [
        id,
        idBU,
        phone,
        name,
        email,
        image,
        timeStart,
        scan,
        nganHang,
        soTaiKhoan,
      ];
}

class FileOTD {
  String id;
  String idBU;
  String phone;
  String name;
  String email;
  String image;
  String timeStart;
  String scan;
  String nganHang;
  String soTaiKhoan;

  FileOTD({
    this.email,
    this.id,
    this.idBU,
    this.image,
    this.name,
    this.nganHang,
    this.phone,
    this.scan,
    this.soTaiKhoan,
    this.timeStart,
  });

  FileOTD.fromJson(Map<String, dynamic> jsonData)
      : id = jsonData[FileField.id],
        idBU = jsonData[FileField.idBU],
        phone = jsonData[FileField.phone],
        name = jsonData[FileField.name],
        email = jsonData[FileField.email],
        image = jsonData[FileField.image],
        timeStart = jsonData[FileField.timeStart],
        scan = jsonData[FileField.scan],
        nganHang = jsonData[FileField.nganHang],
        soTaiKhoan = jsonData[FileField.soTaiKhoan];

  Map<String, dynamic> toJson() => {
        FileField.id: id,
        FileField.idBU: idBU,
        FileField.phone: phone,
        FileField.name: name,
        FileField.email: email,
        FileField.image: image,
        FileField.timeStart: timeStart,
        FileField.scan: scan,
        FileField.nganHang: nganHang,
        FileField.soTaiKhoan: soTaiKhoan,
      };
}
