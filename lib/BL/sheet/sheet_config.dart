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
      print('--------------------config_headers');
      print(config_['headers']);
      print('----');
      for (var item in config_['headers']) {
        print(json.encode(item));
        config.headers.add(json.encode(item));
      }
      print(config.headers);
    }
    try {
      config.columnsSelected =
          bl.blUti.toListString(config_['columnsSelected']);

      config.copyrightUrl = config_['copyrightUrl'] ?? '';
      config.sheetUrl = config_['sheetUrl'] ?? '';
      for (var item in config_['selects1']) {
        config.selects1.add(json.encode(item));
      }
      config.byValueColumns = bl.blUti.toListString(config_['filterByValue']);
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
