import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

import '../bl.dart';

part 'sheet_config.g.dart'; // flutter pub run build_runner build

@Collection()
class SheetConfig {
  int id = Isar.autoIncrement;
  String sheetKey = '';

  String sheetName = '';
  String fileId = '';

  List<String> headerCols = [];

  Map sheetIdent = {
    "sheetName": '',
    "fileId": '',
    "fileIdUrl": '',
    "originUrl": '',
    "copyrightPageUrl": '',
    "createdBy": 'automat'
  };
  List<String> sheetIdentStr = [];
  Map headers = {};
  List<String> getRows = [];
  List<String> selects1 = [];
  List<String> byValueColumns = [];

  Map rawConfig = {};

  SheetConfig();

  void setKey(String sheetName, String fileId) {
    sheetIdent["sheetName"] = sheetName;
    sheetIdent["fileId"] = fileId;
    sheetKey = "${sheetIdent["sheetName"]}__|__${sheetIdent["fileId"]}";
  }

  factory SheetConfig.fromJson(Map config_) {
    SheetConfig config = SheetConfig();
    config.sheetName = config_['sheetName'] ?? '';

    config.fileId = config_['fileId'];
    config.setKey(config_['sheetName'], config_['fileId']);
    //--------------------------------------------------ident
    config.sheetIdent["createdBy"] = 'cloud';

    try {
      config.sheetIdent["sheetName"] =
          json.encode(config_['sheetIdent']['sheetName'] ?? '');

      config.sheetIdent["fileId"] =
          json.encode(config_['sheetIdent']['fileId'] ?? '');

      config.sheetIdent["fileIdUrl"] =
          json.encode(config_['sheetIdent']['fileIdUrl'] ?? '');

      config.sheetIdent["originUrl"] =
          json.encode(config_['sheetIdent']['originUrl'] ?? '');

      config.sheetIdent["copyrightPageUrl"] =
          json.encode(config_['sheetParams']['copyrightPageUrl'] ?? '');
    } catch (e) {
      //rint(e);

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

    sheetIdent:
    $sheetIdent
    
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

class SheetConfigDb {
  final Isar isar;

  SheetConfigDb(this.isar);

  Future<int> sheetKeyExists(String sheetKey) async {
    final sheetExists =
        isar.sheetConfigs.where().filter().sheetKeyEqualTo(sheetKey);
    int count = await sheetExists.count();
    if (count > 0) {
      SheetConfig? sheetConfig = await sheetExists.findFirst();
      return sheetConfig!.id;
    }
    return -1;
  }

  Future<SheetConfig?> readSheet(String sheetKey) async {
    final sheetConfigExists =
        isar.sheetConfigs.where().filter().sheetKeyEqualTo(sheetKey);
    int count = await sheetConfigExists.count();
    if (count == 0) return SheetConfig();
    SheetConfig? sheetConfig = await sheetConfigExists.findFirst();
    sheetConfig?.sheetIdent = json.decode(sheetConfig.sheetIdentStr[0]);
    return sheetConfig;
  }

  Future updateConfig(SheetConfig sheetConfig) async {
    int sheetKeyExistsId = await sheetKeyExists(sheetConfig.sheetKey);
    if (sheetKeyExistsId > -1) {
      await isar.writeTxn((isar) async {
        isar.sheetConfigs.delete(sheetKeyExistsId); // delete
      });
    }

    sheetConfig.sheetIdentStr.clear();

    sheetConfig.sheetIdentStr.add(jsonEncode(sheetConfig.sheetIdent));

    try {
      await isar.writeTxn((isar) async {
        sheetConfig.id = await isar.sheetConfigs.put(
          sheetConfig,
          replaceOnConflict: true,
        ); // insert
      });
      return 'OK';
    } catch (e) {
      if (kDebugMode) print(e);
      logi('--- LocalStore: ', '-----------------isar');
      logi('updateSheets(String ', sheetConfig.sheetKey.toString());
      logi('updateSheets(String ', e.toString());
      return '';
    }
  }
}
