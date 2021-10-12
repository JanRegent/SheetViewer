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
    DataSheet anySheet = DataSheet()
      ..cols = List<String>.from(jsonData["cols"])
      ..columnsSelected = List<String>.from(jsonData["columnsSelected"])
      ..columnsDetailView = List<String>.from(jsonData["columnsDetailView"])
      ..rows = jsonData["rows"];
    return anySheet;
  }
}
