import 'dart:convert';

import '../bl.dart';

class SheetConfig {
  String sheetName = '';
  String fileId = '';
  String cacheUrlkey = '';

  List<String> columnsSelected = [];
  List<String> headers = [];

  String copyrightUrl = '';
  String sheetUrl = '';

  List<String> getRows = [];
  List<String> selects1 = [];
  List<String> byValueColumns = [];

  List<String> columnValuesUniq = [];
  Map rawConfig = {};

  SheetConfig();

  factory SheetConfig.fromJson(Map config_) {
    SheetConfig config = SheetConfig();
    config.rawConfig = config_;

    config.sheetName = config_['sheetName'];
    config.fileId = config_['fileId'];
    config.cacheUrlkey =
        'fileid=${config.fileId}&sheetname=${config.sheetName}';

    if (config_['headers'] != null) {
      for (var item in config_['headers']) {
        config.headers.add(json.encode(item));
      }
    }

    try {
      if (config_['getRows'] != null) {
        for (var item in config_['getRows']) {
          config.getRows.add(json.encode(item));
        }
      }
    } catch (e) {
      config.selects1 = [];
    }

    try {
      if (config_['selects1'] != null) {
        for (var item in config_['selects1']) {
          config.selects1.add(json.encode(item));
        }
      }
    } catch (e) {
      config.selects1 = [];
    }

    try {
      config.columnsSelected =
          bl.blUti.toListString(config_['columnsSelected']);
    } catch (e) {
      config.columnsSelected = [];
    }

    config.copyrightUrl = config_['copyrightUrl'] ?? '';
    config.sheetUrl = config_['sheetUrl'] ?? '';

    try {
      config.byValueColumns = bl.blUti.toListString(config_['filterByValue']);
    } catch (e) {
      config.byValueColumns = [];
    }

    //rint(config.toString());
    return config;
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
    
    headers:
    $headers
    
    getRows:
    $getRows

    selects1:
    $selects1

  
    ''';
  }
}
