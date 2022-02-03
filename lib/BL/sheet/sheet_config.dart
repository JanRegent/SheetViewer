import 'dart:convert';

import '../bl.dart';

class SheetConfig {
  String sheetName = '';
  String fileId = '';
  String cacheUrlkey = '';

  List<String> columnsSelected = [];

  SheetIds sheetIds = SheetIds();
  Map headers = {};
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
    try {
      config.sheetIds.sheetName =
          json.encode(config_['sheetParams']['sheetName'] ?? '');

      config.sheetIds.fileId =
          json.encode(config_['sheetParams']['fileId'] ?? '');

      config.sheetIds.fileIdUrl =
          json.encode(config_['sheetParams']['fileIdUrl'] ?? '');

      config.sheetIds.originUrl =
          json.encode(config_['sheetParams']['originUrl'] ?? '');

      config.sheetIds.copyrightPageUrl =
          json.encode(config_['sheetParams']['copyrightPageUrl'] ?? '');
    } catch (e) {
      //rint(e);
      config.sheetIds = SheetIds();
    }

    try {
      for (Map item in config_['headers']) {
        config.headers[item.keys.first] = item.values.first;
      }
    } catch (e) {
      config.headers = {};
    }
    try {
      if (config_['getRows'] != null) {
        for (var item in config_['getRows']) {
          config.getRows.add(json.encode(item));
        }
      }
    } catch (e) {
      config.getRows = [];
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
   
    sheetParams:
    $sheetIds
    
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

class SheetIds {
  String sheetName = '';
  String fileId = '';
  String fileIdUrl = '';
  String originUrl = '';
  String copyrightPageUrl = '';
}
