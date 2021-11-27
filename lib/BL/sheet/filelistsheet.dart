import 'dart:convert';

import '../bl.dart';

class FileListSheet {
  List<String> cols = [];
  List<dynamic> rows = [];
  String filelistTitle = '';

  FileListSheet();

  factory FileListSheet.fromJson(Map jsonData) {
    if (jsonData.isEmpty) return FileListSheet();
    try {
      FileListSheet anySheet = FileListSheet();
      anySheet.cols = bl.toListString(jsonData["cols"]);
      anySheet.rows = jsonData["rows"];
      return anySheet;
    } catch (e) {
      //rint(e);
      return FileListSheet();
    }
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
