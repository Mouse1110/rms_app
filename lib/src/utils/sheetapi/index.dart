import 'package:gsheets/gsheets.dart';

class SheetAPI {
  static const _creadentials = r'''
  {
  "type": "service_account",
  "project_id": "gsheets-318211",
  "private_key_id": "96363fd2f5d54bb577eb2e41481057fd292f830a",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQClDeWaiwcQqHmX\ngol7rc9JepnK/9wGuk/RpzTtW2LTfn69ADTSvdH3BLlMPaa4edKcCSxb1hPnBT4y\nC6bK+ZHXJ3DTOM6YUXLe2aLcnl305QQJk3Y4Arc1tiZkPeAVw5O4Sub4/5C6CsTn\ny/ij0iWJDlOstUDDwfgqQPrscZO+R1/vmIQBqm0dyd1rrUOLPuGspdiBygCthSUY\nISumf6ptPPga5KJxVBFYCw1lXIagQ2qZ2nzeAq+otQss5BOIxh0HuKjR/VcV0QYm\ng2MNs+DnrKlpa2kiZGkCqaCV2STtSs14w9DdlpiguzuUYmUHc12UkDmTIVQFBc0r\n62JZXOQlAgMBAAECggEAAQEHEMfpYKly9CEDsXtVuh70mYLAL0lDei195DcMS9l0\nMVak1ws5TB3NRLJmn8S1e7/Y0km721+kwy6ZiKdK54D5UMCGbNpfeBTD62URgjen\nj7CbsEKQFVAaJBVVEoLDOU2uT1ELPDCJcBhUI93xL09cSUj6dSmWPXghm2uuefa2\nR10dk5LDYWCpiELAafW2Jx0t7qSy/nia8G9A/+FOe+XAlhp3hZVxmCJHhcE8YxhX\nh76hf4jFbqX7iQG1c9eD5LCV/Ja+8X57QJ1KBkRmre7Rwg9GgPu6RXDqxZ2gRWJJ\n9MVO+fRKmTM1Oy0GxDkveWCgogMbgnWAhUhMpZmcgQKBgQDbcB9NuksMrh/QlaZV\n4x0cxf8m4rDEgcOHOqREmYYdgkyn5/iLPUYC2E9OT7Ljb3aVggm4FEtPjgPQzjxF\nCLBr9rjKcKWtlvzyLq8ovIUTZWx25A8Q71R7SfpPMFi3uTfkiFG7AcjMTU2QzzCH\nFUhm0Z8xuv0fGP0b1Ul2YnkrYQKBgQDAjhmWaqzCOoovB6OtL6gEefM+76joO5J5\nzjWCdUQjEcsbLRceA61FNOcHOP1Wpz2roKgHTQ6L8RbmqGuNglgFqaKKtuJbMz1t\nCanWwYZ7bbrmmqP1i4NC7ZZuPrLKDX8ykL3D6nmT4spIWO1SXUYJdn8WVOLsFh1+\nSa9OPfwTRQKBgH/gC+3wxPFjuxiDTMY6LmnpG/JeIiKxd+8jBj0Pti8WEnO6Y4VI\ntLbNtRFuslGFT/Z6LA3Ajc6TdLfGpyqXkK+pvDAEixfoqAi9mcdEbMxLy3RRHFKD\nFZkvGBXzl4+g+OhNZEt1E72ywqPDiYT+qw131KxXSlBH8J+6oC/D3NahAoGASBer\n2tY7skiqnesVS+0w0eQ6v1CJg9FyCOq8vAhdp2etDJK4OgOUZvnkmZ6rszrQayau\nYnVmQdzU/y0Ff6jSfeRCN/87BnxLvjxE+2PfjuzJcjdptbAzR+aeUM5msCGXgv4Q\nHn72X/kkVSv+Rr0nULmt4VWM1Gl/R14dJYUtkKUCgYBkCPn6nHSOYezTUPPEv6Ly\ngdWN0E/LzWp5jcvMzFGXhP1X2IiqY7lkojAEvTLNiomFJRuHxIpDFNpFXaHc3uAx\nZxUi9SjBaaGoGpVF7hBj+cW6xZk5/f6iU0jWKKotfbr3c26f1gcAwxFAfbnlE35t\ne+/rhE817ZTKnjQNk4Y2JQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheets-318211.iam.gserviceaccount.com",
  "client_id": "101958950607199100396",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheets-318211.iam.gserviceaccount.com"
}
''';

  static final _spreadsheetId = '1MAkr-ywoMv5AVTrxBEiDLM5oxIenOLRep3YFG3LiQQY';
  static final _gsheets = GSheets(_creadentials);
  static Worksheet _sheet;
  static final sheetShow = '1MAkr-ywoMv5AVTrxBEiDLM5oxIenOLRep3YFG3LiQQY';

  static Future init(String title) async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _sheet = await _getWorkSheet(spreadsheet, title: title);
    } catch (e) {
      print('Fix :$e');
    }
  }

  static Future initLog(String title, String spread) async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(spread);
      _sheet = await _getWorkSheet(spreadsheet, title: title);
    } catch (e) {
      print('Fix :$e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title);
    }
  }

  /// Method Communication Client vs Google Sheet Data
  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_sheet == null) return;
    _sheet.values.map.appendRows(rowList);
  }

  static Future update(Map<String, dynamic> rowList, dynamic key) async {
    if (_sheet == null) return;
    _sheet.values.map.insertRowByKey(key, rowList);
  }

  static Future<Map<String, String>> getLastRow() async {
    if (_sheet == null) return null;
    return await _sheet.values.map.lastRow();
  }

  static Future<List<Map<String, dynamic>>> getAllRow() async {
    if (_sheet == null) return null;
    return await _sheet.values.map.allRows();
  }

  static Future<List<List<String>>> getAllRowNotMap() async {
    if (_sheet == null) return null;
    return await _sheet.values.allRows();
  }

  static Future<String> getTitleSheet() async {
    if (_sheet == null) return null;
    return _sheet.title;
  }
}
