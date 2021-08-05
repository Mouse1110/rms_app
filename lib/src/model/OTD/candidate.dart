class CandidateField {
  static String name = 'Full name';
  static String email = 'Email';
  static String phone = 'Phone';
  static String image = 'Image';
  static String facebook = 'Facebook';
  static String viTri = 'Vị trí ứng tuyển';
  static String soYeu = 'Gửi sơ yếu lý lịch hoặc thư xin việc của bạn';
  static String note = 'Note';

  static List<String> getFields() => [
        name,
        email,
        phone,
        image,
        facebook,
        viTri,
        soYeu,
        note,
      ];
}

class CandidateOTD {
  String name;
  String email;
  String phone;
  String image;
  String facebook;
  String viTri;
  String soYeu;
  String note;

  CandidateOTD({
    this.email,
    this.facebook,
    this.image,
    this.name,
    this.note,
    this.phone,
    this.soYeu,
    this.viTri,
  });

  CandidateOTD.fromJson(Map<String, dynamic> jsonData)
      : name = jsonData[CandidateField.name],
        email = jsonData[CandidateField.email],
        phone = jsonData[CandidateField.phone],
        image = jsonData[CandidateField.image],
        facebook = jsonData[CandidateField.facebook],
        viTri = jsonData[CandidateField.viTri],
        soYeu = jsonData[CandidateField.soYeu],
        note = jsonData[CandidateField.note];

  Map<String, dynamic> toJson() => {
        CandidateField.name: name,
        CandidateField.email: email,
        CandidateField.phone: phone,
        CandidateField.image: image,
        CandidateField.facebook: facebook,
        CandidateField.viTri: viTri,
        CandidateField.soYeu: soYeu,
        CandidateField.note: note,
      };
}
