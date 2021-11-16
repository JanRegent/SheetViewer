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

class TabsListSheet {
  List<dynamic> cols = [];
  List<dynamic> rows = [];
  String tabslistTitle = '';

  TabsListSheet();

  factory TabsListSheet.fromJson(String jsonString) {
    if (jsonString.isEmpty) return TabsListSheet();
    var jsonData = json.decode(jsonString);
    TabsListSheet anySheet = TabsListSheet()
      ..cols = jsonData["cols"]
      ..rows = jsonData["rows"];
    return anySheet;
  }
}
