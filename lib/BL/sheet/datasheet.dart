// ignore_for_file: avoid_print

import 'dart:convert';

import '../bl.dart';

class DataSheet {
  List<String> cols = [];
  List<dynamic> rows = [];
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
  String sheetName = '';
  String fileId = '';
  List<String> columnsSelected = [];
  List<String> selects1 = [];
  String copyrightUrl = '';
  SheetConfig();

  factory SheetConfig.fromJson(Map config_) {
    SheetConfig config = SheetConfig();
    config.sheetName = config_['sheetName'];
    config.fileId = config_['fileId'][0];
    config.columnsSelected = bl.toListString(config_['columnsSelected']);
    config.copyrightUrl = config_['copyrightUrl'][0];
    for (var item in config_['selects1']) {
      config.selects1.add(json.encode(item));
    }
    return config;
  }

  @override
  String toString() {
    return ''' 
    sheetName:        $sheetName
    fileId:           $fileId 
    columnsSelected:  $columnsSelected 
    copyrightUrl:     $copyrightUrl

    selects1:
    $selects1
    ''';
  }
}
