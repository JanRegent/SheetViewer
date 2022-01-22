import 'dart:convert';

import '../bl.dart';

class SheetConfig {
  String sheetName = '';
  String fileId = '';
  String cacheUrlkey = '';

  List<String> columnsSelected = [];
  List<String> columns = [];

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
    print('****fromJson ');
    print(config_['columns']);
    try {
      config.columnsSelected =
          bl.blUti.toListString(config_['columnsSelected']);
      config.columns = config_['columns'] ?? {};
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
