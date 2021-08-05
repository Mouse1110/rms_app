import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileConfig {
  static Future<String> get getFilePath async {
    final direc = await getApplicationDocumentsDirectory();
    return direc.path;
  }

  static Future<File> get getFile async {
    final path = await getFilePath;
    return File('$path/log.txt');
  }

  static Future<File> saveToFile(String data) async {
    final file = await getFile;
    return file.writeAsString(data);
  }

  static Future<String> readFromFile() async {
    try {
      final file = await getFile;
      String fileContents = await file.readAsString();
      return fileContents;
    } catch (e) {
      return '';
    }
  }
}
