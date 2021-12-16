import 'dart:convert';

import '../bl.dart';

class SheetConfig {
  String sheetName = '';
  String fileId = '';

  List<String> columnsSelected = [];
  List<String> selects1 = [];
  String copyrightUrl = '';
  String sheetUrl = '';

  Map rawConfig = {};

  SheetConfig();

  factory SheetConfig.fromJson(Map config_) {
    SheetConfig config = SheetConfig();
    config.rawConfig = config_;

    config.sheetName = config_['sheetName'];
    config.fileId = config_['fileId'];

    try {
      config.columnsSelected = bl.toListString(config_['columnsSelected']);
      config.copyrightUrl = config_['copyrightUrl'] ?? '';
      config.sheetUrl = config_['sheetUrl'] ?? '';
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
    ------------------------------------------config
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
