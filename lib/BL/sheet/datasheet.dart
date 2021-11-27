// ignore_for_file: avoid_print

import 'dart:convert';

import '../bl.dart';

class DataSheet {
  List<String> cols = [];
  List<dynamic> rows = [];
  List<String> columnsSelected = [];
  String sheetUrl = '';
  SheetConfig config = SheetConfig();

  //temp
  String sheetTitle = '';

  DataSheet();

  factory DataSheet.fromJson(Map jsonData) {
    SheetConfig config_ = SheetConfig.fromJson(jsonData['config']);
    print('--------------');
    print(config_.toString());
    try {
      List<String> cols = List<String>.from(jsonData["cols"]);
      DataSheet anySheet = DataSheet()
        ..config = config_
        ..cols = cols
        ..columnsSelected = jsonData["columnsSelected"] != null
            ? List<String>.from(jsonData["columnsSelected"])
            : cols
        ..sheetUrl = jsonData["sheetUrl"]
        ..rows = jsonData["rows"];
      return anySheet;
    } catch (e) {
      //rint(e);
      return DataSheet();
    }
  }
}

class SheetConfig {
  List<String> columnsSelected = [];
  List<String> selects1 = [];
  String copyrightUrl = '';
  SheetConfig();

  factory SheetConfig.fromJson(Map config_) {
    SheetConfig config = SheetConfig();
    config.columnsSelected = bl.toListString(config_['columnsSelected']);
    print(config_);
    config.copyrightUrl = config_['copyrightUrl'][0];
    for (var item in config_['selects1']) {
      config.selects1.add(json.encode(item));
    }
    print(config.selects1[1]);
    return config;
  }

  @override
  String toString() {
    return ''' 
    $columnsSelected 
    $copyrightUrl
    $selects1
    ''';
  }
}
