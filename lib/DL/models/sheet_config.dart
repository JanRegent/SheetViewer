import 'dart:convert';

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
    config.id = config_['id'];
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
      config.byValueColumns = bl.blUti.toListString(config_['byValueColumns']);
    } catch (e) {
      print(e);
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

  // Future updateConfig2(SheetConfig sheetConfig) async {
  //   try {
  //     await isar.writeTxn((isar) async {
  //       sheetConfig.id = await isar.sheetConfigs.put(
  //         sheetConfig,
  //         replaceOnConflict: true,
  //       ); // insert
  //     });
  //     return 'OK';
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('--- updateConfig2: -----------------isar');
  //       print(e);
  //     }
  //     logi('--- updateConfig2: ', '-----------------isar');
  //     logi('updateConfig2(String ', sheetConfig.sheetKey.toString());
  //     logi('updateConfig2(String ', e.toString());
  //     return '';
  //   }
  // }

  Future updateConfig3(SheetConfig sheetConfig, int id) async {
    try {
      SheetConfig? sheetConfig_ = await isar.sheetConfigs.get(id);
      sheetConfig.id = id;
      sheetConfig_ = sheetConfig;
      await isar.writeTxn((isar) async {
        sheetConfig.id = await isar.sheetConfigs.put(
          sheetConfig_!,
          replaceOnConflict: true,
        ); // insert
      });
      return 'OK';
    } catch (e) {
      if (kDebugMode) {
        print('--- updateConfig3: -----------------isar');
        print(e);
      }
      logi('--- updateConfig3: ', '-----------------isar');
      logi('updateConfig3(String ', sheetConfig.sheetKey.toString());
      logi('updateConfig3(String ', e.toString());
      return '';
    }
  }

  Future updateConfig1(SheetConfig sheetConfig) async {
    sheetConfig.id = DateTime.now().millisecondsSinceEpoch;
    sheetConfig.sheetIdentStr.clear();
    sheetConfig.sheetIdentStr.add(jsonEncode(sheetConfig.sheetIdent));
    sheetConfig.byValueColumns.add(DateTime.now().toIso8601String());
    try {
      print(sheetConfig.id);
      await isar.writeTxn((isar) async {
        sheetConfig.id = await isar.sheetConfigs.put(
          sheetConfig,
          replaceOnConflict: false,
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
