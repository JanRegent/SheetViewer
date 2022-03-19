import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

part 'sheet_config.g.dart'; // flutter pub run build_runner build

@Collection()
class SheetConfig {
  int id = -1;

  String sheetKey = '';

  @Index(unique: true)
  String sheetNameFileIdKey = '';

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

    sheetNameFileIdKey = sheetKey;
  }

  void setShetnameFileKey(String sheetName, String fileId) {
    sheetNameFileIdKey = "${sheetName}__|__$fileId";
  }

  String getKey(String sheetName, String fileId) {
    return "${sheetName}__|__$fileId";
  }

  factory SheetConfig.fromJson(Map config_) {
    SheetConfig config = SheetConfig();
    config.id = config_['id'] ?? DateTime.now().millisecondsSinceEpoch;
    config.sheetName = config_['sheetName'] ?? '';
    config.fileId = config_['fileId'] ?? '';
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
      config.byValueColumns = bl.blUti.toListString(config_['byValueColumns']);
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

  Future init() async {}

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

  Future<SheetConfig> readSheetByIndex(String sheetNameFileKey) async {
    try {
      final listMap =
          isar.sheetConfigs.where().sheetNameFileIdKeyEqualTo(sheetNameFileKey);
      List<Map<String, dynamic>> listJson = await listMap.exportJson();

      SheetConfig sheetConfig = SheetConfig.fromJson(listJson[0]);
      return sheetConfig;
    } catch (_) {
      return SheetConfig()..id = -1;
    }
  }

  Future<List<int>> readIds() async {
    try {
      final List<int> ids = await isar.sheetConfigs
          .filter()
          .idGreaterThan(0)
          .idProperty()
          .findAll();
      return ids;
    } catch (_) {
      return [];
    }
  }

  Future updateConfig(SheetConfig sheetConfig) async {
    if (kDebugMode) {
      print('--------------------------updateConfig');
      print(sheetConfig.id);
      print(sheetConfig.byValueColumns);
    }
    try {
      await isar.writeTxn((isar) async {
        await isar.sheetConfigs.put(
          sheetConfig,
          replaceOnConflict: true,
        );
      });
      return 'OK';
    } catch (e) {
      if (kDebugMode) {
        print('--- updateConfig: -----------------isar');
        print(e);
      }
      logi('--- updateConfig: ', '-----------------isar');
      logi('updateConfig(String ', sheetConfig.sheetKey.toString());
      logi('updateConfig(String ', e.toString());
      return '';
    }
  }
}

Future createSheetConfigIfNotExists(String fileId, String sheetName) async {
  SheetConfig sheetConfig = SheetConfig();
  sheetConfig.id = DateTime.now().millisecondsSinceEpoch;
  sheetConfig.setKey(sheetName, fileId);
  int sheetKeyExistsId =
      await sheetConfigDb.sheetKeyExists(sheetConfig.sheetKey);
  if (sheetKeyExistsId > -1) return;

  sheetConfig.getRows.add('{"action":"getRowsLast","rowsCount":10}');
  sheetConfig.getRows.add('{"action":"getRowsFirst","rowsCount":10}');
  sheetConfigDb.updateConfig(sheetConfig);
}

Future<SheetConfig> getSheetConfig(String fileId, String sheetName) async {
  try {
    String queryString =
        'sheetName=$sheetName&action=getSheetConfig&fileId=$fileId';

    String urlQuery = bl.blGlobal.contentServiceUrl + '?' + queryString;

    var response = await Dio().get(urlQuery);
    SheetConfig sheetConfig = SheetConfig.fromJson(response.data);

    sheetConfigDb.updateConfig(sheetConfig);
    return sheetConfig;
  } catch (e) {
    return SheetConfig();
  }
}

Future<String> logOn() async {
  try {
    var response =
        await Dio().get(bl.blGlobal.contentServiceUrl + '?action=logon');
    String resp = response.data.toString();
    return resp;
  } catch (e) {
    return '';
  }
}
