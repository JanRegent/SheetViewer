import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

import '../bl.dart';

part 'sheet_config.g.dart'; // flutter pub run build_runner build

@Collection()
class SheetConfig {
  int id = Isar.autoIncrement;
  String key = '';

  String sheetName = '';
  String fileId = '';

  List<String> headerCols = [];

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
    config.key = 'fileid=${config.fileId}&sheetname=${config.sheetName}';
    try {
      config.sheetIds.sheetName =
          json.encode(config_['sheetIdent']['sheetName'] ?? '');

      config.sheetIds.fileId =
          json.encode(config_['sheetIdent']['fileId'] ?? '');

      config.sheetIds.fileIdUrl =
          json.encode(config_['sheetIdent']['fileIdUrl'] ?? '');

      config.sheetIds.originUrl =
          json.encode(config_['sheetIdent']['originUrl'] ?? '');

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
      if (config_['select1'] != null) {
        for (var item in config_['select1']) {
          config.selects1.add(json.encode(item));
        }
      }
    } catch (e) {
      config.selects1 = [];
    }

    try {
      config.headerCols = bl.blUti.toListString(config_['headerCols']);
    } catch (e) {
      config.headerCols = [];
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
    fileId:           $fileId

    sheetParams:
    $sheetIds
    
    headerCols:  $headerCols
    
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

class SheetConfigDb {
  final Isar isar;

  SheetConfigDb(this.isar);

  Future<int> keysCount(String key) async {
    final sheetExists = isar.sheetConfigs.where().filter().keyEqualTo(key);
    int count = await sheetExists.count();
    return count;
  }

  Future updateConfig(String key, SheetConfig sheetConfig) async {
    int keyCount_ = await keysCount(key);
    if (keyCount_ > 0) {
      return 'OK';
    }

    sheetConfig.key = key;

    // for (var i = 0; i < rows.length; i++) {
    //   sheetConfig.rows.add(jsonEncode(rows[i]));
    // }
    try {
      await isar.writeTxn((isar) async {
        sheetConfig.id = await isar.sheetConfigs.put(sheetConfig); // insert
      });
      return 'OK';
    } catch (e) {
      if (kDebugMode) print(e);
      logi('--- LocalStore: ', '-----------------isar');
      logi('updateSheets(String ', key);
      logi('updateSheets(String ', e.toString());
      return '';
    }
  }
}
