import 'dart:convert';

import '../bl.dart';

class DataSheet {
  List<String> cols = [];
  List<dynamic> rows = [];
  SheetConfig config = SheetConfig();

  //temp
  String sheetTitle = '';

  DataSheet();

  factory DataSheet.fromJson(Map jsonData) {
    SheetConfig config_ = SheetConfig.fromJson(jsonData['config']);

    try {
      List<String> cols = List<String>.from(jsonData["cols"]);
      if (config_.columnsSelected.isEmpty) config_.columnsSelected = cols;
      DataSheet anySheet = DataSheet()
        ..config = config_
        ..cols = cols
        ..rows = jsonData["rows"];
      return anySheet;
    } catch (e) {
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
  String sheetUrl = '';
  SheetConfig();

  factory SheetConfig.fromJson(Map config_) {
    SheetConfig config = SheetConfig();
    config.sheetName = config_['sheetName'];
    config.fileId = config_['fileId'];
    try {
      config.columnsSelected = bl.toListString(config_['columnsSelected']);
      config.sheetUrl = config_["sheetUrl"];
      config_['copyrightUrl'] != '' ? config_['copyrightUrl'] : '';
      config_['sheetUrl:'] != '' ? config_['sheetUrl:'] : '';
      for (var item in config_['selects1']) {
        config.selects1.add(json.encode(item));
      }
      return config;
    } catch (e) {
      return config;
    }
  }

  @override
  String toString() {
    return ''' 
    sheetName:        $sheetName
    fileId:           $fileId 

    copyrightUrl:     $copyrightUrl
    sheetUrl:         $sheetUrl

    
    columnsSelected:  $columnsSelected 

    selects1:
    $selects1
    ''';
  }
}
