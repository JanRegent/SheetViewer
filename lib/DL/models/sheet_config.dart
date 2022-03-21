import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

part 'sheet_config.g.dart'; // flutter pub run build_runner build

@Collection()
class SheetConfig {
  @Id()
  int id = -1;

  @Index(unique: true)
  String sheetNameFileIdKey = '';

  String sheetName = '';
  String fileId = '';

  List<String> headerCols = [];

  String fileIdUrl = '';
  String originUrl = '';
  String copyrightPageUrl = '';
  String createdBy = '';

  List<String> headers = [];
  List<String> getRows = [];
  List<String> selects1 = [];
  List<String> byValueColumns = [];

  SheetConfig();

  void setKey(String sheetName, String fileId) {
    this.sheetName = sheetName;
    this.fileId = fileId;
    sheetNameFileIdKey = "${sheetName}__|__$fileId";
  }

  void setShetnameFileKey(String sheetName, String fileId) {
    sheetNameFileIdKey = "${sheetName}__|__$fileId";
  }

  String getKey(String sheetName, String fileId) {
    return "${sheetName}__|__$fileId";
  }

  factory SheetConfig.fromJson(Map config_) {
    SheetConfig config = SheetConfig();

    config.sheetName = config_['sheetName'] ?? '';
    config.fileId = config_['fileId'] ?? '';
    config.setKey(config_['sheetName'], config_['fileId']);

    config.createdBy = 'cloud';

    // try {
    //   for (Map item in config_['headers']) {
    //     config.headers[item.keys.first] = item.values.first;
    //   }
    // } catch (e) {
    //   config.headers = [];
    // }
    try {
      if (config_['getRows'].toList() != null) {
        for (var item in config_['getRows']) {
          config.getRows.add(json.encode(item));
        }
      }
    } catch (e) {
      config.getRows = [];
    }

    // try {
    //   if (config_['select1'] != null) {
    //     for (var item in config_['select1']) {
    //       config.selects1.add(json.encode(item));
    //     }
    //   }
    // } catch (e) {
    //   config.selects1 = [];
    // }

    // try {
    //   config.headerCols = bl.blUti.toListString(config_['headerCols']);
    // } catch (e) {
    //   config.headerCols = [];
    // }

    // try {
    //   config.byValueColumns = bl.blUti.toListString(config_['byValueColumns']);
    // } catch (e) {
    //   config.byValueColumns = [];
    // }

    //rint(config.toString());
    return config;
  }

  @override
  String toString() {
    return ''' 
    ------------------------------------------config
    id:               $id  
    sheetName:        $sheetName
    fileId:           $fileId

    headerCols:  $headerCols
    
    headers:
    $headers
    
    getRows:
    $getRows

    selects1:
    $selects1

    byValueColumns:
    $byValueColumns
  
    ''';
  }
}

class SheetConfigDb {
  final Isar isar;

  SheetConfigDb(this.isar);

  int maxId = -1;

  Future init() async {
    await updateMaxId();
  }

  Future<int> updateMaxId() async {
    int max = maxId;
    List<int> ids = await readIds();
    if (ids.isNotEmpty) {
      max = ids.reduce((curr, next) => curr > next ? curr : next);
    }
    return max + 1;
  }

  Future<SheetConfig?> readSheet(String sheetNameFileKey) async {
    final sheetConfigExists = isar.sheetConfigs
        .where()
        .filter()
        .sheetNameFileIdKeyEqualTo(sheetNameFileKey);
    int count = await sheetConfigExists.count();
    if (count == 0) return SheetConfig();
    SheetConfig? sheetConfig = await sheetConfigExists.findFirst();
    return sheetConfig;
  }

  Future<SheetConfig?> readSheetByIndex(String sheetNameFileKey) async {
    int? id = await getId(sheetNameFileKey);
    if (id == null) return SheetConfig();

    try {
      SheetConfig? sheetConfig = await isar.sheetConfigs.get(id);
      return sheetConfig;
    } catch (e) {
      if (kDebugMode) {
        print(
            '---------------------------------readSheetByIndex $id  $sheetNameFileKey');
        print(e);
      }
      return null;
    }
  }

  Future<int?> getId(String sheetNameFileKey) async {
    try {
      final int? id = await isar.sheetConfigs
          .filter()
          .sheetNameFileIdKeyEqualTo(sheetNameFileKey)
          .idProperty()
          .findFirst();
      return id;
    } catch (_) {
      return null;
    }
  }

  Future<List<int>> readIds() async {
    try {
      final List<int> ids = await isar.sheetConfigs
          .filter()
          .idGreaterThan(-1)
          .idProperty()
          .findAll();
      return ids;
    } catch (_) {
      return [];
    }
  }

  Future updateConfig(SheetConfig sheetConfig) async {
    if (sheetConfig.id == -1) {
      maxId += 1;
      sheetConfig.id = maxId;
    }
    if (kDebugMode) {
      print(
          '------------updateConfig ${sheetConfig.id} ${sheetConfig.sheetName}');
    }
    int? idd;
    try {
      await isar.writeTxn((isar) async {
        idd = await isar.sheetConfigs.put(
          sheetConfig,
          replaceOnConflict: false,
        );
      });
      if (kDebugMode) {
        print('--------------------------updateConfig');
        print(sheetConfig.id);
        print('**sheetConfig.byValueColumns');
        print(sheetConfig.byValueColumns);
      }
      return 'OK';
    } catch (e) {
      if (kDebugMode) {
        print('--- updateConfig: -----------------isar idd $idd');
        print(e);
      }
      logi('--- updateConfig: ', '-----------------isar');
      logi('updateConfig(String ', sheetConfig.sheetNameFileIdKey);
      logi('updateConfig(String ', e.toString());
      return '';
    }
  }
}

Future createSheetConfigIfNotExists(String fileId, String sheetName) async {
  SheetConfig sheetConfig = SheetConfig()
    ..sheetName = sheetName
    ..fileId = fileId;
  sheetConfig.setKey(sheetName, fileId);

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
