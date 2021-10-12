// ignore_for_file: avoid_print

import 'dart:convert';

class FileListSheet {
  List<String> cols = [];
  List<dynamic> rows = [];
  String filelistTitle = '';

  FileListSheet();

  factory FileListSheet.fromJson(String jsonString) {
    if (jsonString.isEmpty) return FileListSheet();

    var jsonData = json.decode(jsonString);
    FileListSheet anySheet = FileListSheet()
      ..cols = List<String>.from(jsonData["cols"])
      ..filelistTitle = jsonData["filelistTitle"][0]
      ..rows = jsonData["rows"];
    return anySheet;
  }
}
