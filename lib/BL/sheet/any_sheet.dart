// ignore_for_file: avoid_print

import 'dart:convert';

class AnySheet {
  List<String> cols = [];
  List<dynamic> rows = [];
  List<String> columnsSelected = [];
  List<String> columnsDetailView = [];

  AnySheet();

  factory AnySheet.fromJson(String jsonString) {
    var jsonData = json.decode(jsonString);
    AnySheet anySheet = AnySheet()
      ..cols = List<String>.from(jsonData["cols"])
      ..columnsSelected = List<String>.from(jsonData["columnsSelected"])
      ..columnsDetailView = List<String>.from(jsonData["columnsDetailView"])
      ..rows = jsonData["rows"];
    return anySheet;
  }
}
