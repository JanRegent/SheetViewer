import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';
import 'package:sheetviewer/DL/get_sheetview.dart';

part 'zsheetconfig.g.dart'; // flutter pub run build_runner build

@Collection()
class SheetConfig {
  @Id() //selfmanaget id, beacose autoincrement unctement rows wery slowly (rows joined)
  int id = -1;

  @Index(unique: true)
  String sheetNameFileIdKey = '';

  String sheetName = '';
  String fileId = '';
  String fileUrl = '';
  String sheetNameConfig = '';
  String fileIdConfig = '';

  String copyrightUrl = '';
  String createdBy = '';

  String headerCols = '';
  String headers = '';

  String getRows = '';
  String selects1 = '';
  String byValueColumns = '';

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
    config.id = -1;

    config.sheetName = config_['sheetName'] ?? '';
    config.fileId = config_['fileId'] ?? '';
    config.fileUrl = config_['fileUrl'] ?? '';
    config.setKey(config_['sheetName'], config_['fileId']);
    config.copyrightUrl = config_['copyrightUrl'] ?? '';
    config.createdBy = 'cloud';

    config.getRows = config_['getRows'] ?? '';
    config.selects1 = config_['selects1'] ?? '';

    //config.headers = config_['headers'] ?? '';

    config.byValueColumns = config_['byValueColumns'] ?? '';

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
    //if (id == null) return SheetConfig();

    try {
      SheetConfig? sheetConfig = await isar.sheetConfigs.get(id!);
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
    } catch (e) {
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

    try {
      await isar.writeTxn((isar) async {
        await isar.sheetConfigs.put(
          sheetConfig,
          replaceOnConflict: true,
        );
      });
      if (kDebugMode) {
        // print('--------------------------updateConfig');
        // print(sheetConfig);
      }
      return 'OK';
    } catch (e) {
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

  // sheetConfig.getRows.add('{"action":"getRowsLast","rowsCount":10}');
  // sheetConfig.getRows.add('{"action":"getRowsFirst","rowsCount":10}');
  sheetConfigDb.updateConfig(sheetConfig);
}

Future<SheetConfig> getSheetConfig(String fileId, String sheetName) async {
  // ignore: prefer_typing_uninitialized_variables
  var response;
  try {
    String queryString =
        'sheetName=$sheetName&action=getSheetConfig&fileId=$fileId';

    String urlQuery =
        await localDb.read('DL-contentServiceUrl', String) + '?' + queryString;
    response = await dio.get(urlQuery);
  } catch (e) {
    logi('getSheetConfig() dio error:', e.toString());
  }

  SheetConfig sheetConfig = SheetConfig();
  try {
    sheetConfig = SheetConfig.fromJson(response.data);
  } catch (e) {
    if (kDebugMode) {
      print('--- getSheetConfig: -----------------fromJson');
      print(e);
    }
  }

  try {
    sheetConfigDb.updateConfig(sheetConfig);
    return sheetConfig;
  } catch (e) {
    if (kDebugMode) {
      print('--- getSheetConfig(): -updateConfig');
      print(e);
    }
    return SheetConfig();
  }
}

Future<String> logOn() async {
  try {
    var response = await dio.get(
        await localDb.read('DL-contentServiceUrl', String) + '?action=logon');
    String resp = response.data.toString();
    return resp;
  } catch (e) {
    return '';
  }
}
