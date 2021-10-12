// ignore_for_file: avoid_print

import 'dart:convert';

class DataSheet {
  List<String> cols = [];
  List<dynamic> rows = [];
  List<String> columnsSelected = [];
  List<String> columnsDetailView = [];

  DataSheet();

  factory DataSheet.fromJson(String jsonString) {
    var jsonData = json.decode(jsonString);
    List<String> cols = List<String>.from(jsonData["cols"]);
    DataSheet anySheet = DataSheet()
      ..cols = cols
      ..columnsSelected = jsonData["columnsSelected"] != null
          ? List<String>.from(jsonData["columnsSelected"])
          : cols
      ..columnsDetailView = jsonData["columnsDetailView"] != null
          ? List<String>.from(jsonData["columnsDetailView"])
          : cols
      ..rows = jsonData["rows"];

    return anySheet;
  }
}
