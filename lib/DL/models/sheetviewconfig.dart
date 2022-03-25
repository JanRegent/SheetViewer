import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'package:sheetviewer/BL/lib/blglobal.dart';

part 'sheetviewconfig.g.dart'; // flutter pub run build_runner build

@Collection()
class SheetViewConfig {
  int id = Isar.autoIncrement;
  String aQuerystringKey = '';
  String aStatus = '';

  String colsHeader = '';
  String queryVars = '';

  SheetViewConfig();

  @override
  String toString() {
    return '''
  ----------------------------------------------------------------------shetView
  id $id
  aQuerystringKey $aQuerystringKey
  aStatus         $aStatus

  colsHeader      $colsHeader
  queryVars       $queryVars



    ''';
  }

  factory SheetViewConfig.fromJson(Map jsonData) {
    try {
      SheetViewConfig sheetViewConfig = SheetViewConfig()
        ..aQuerystringKey = jsonData["config"]["queryString"] ?? '';

      sheetViewConfig.colsHeader = jsonData["colsHeader"] ?? '';
      sheetViewConfig.queryVars = jsonData["queryVars"] ?? '';

      return sheetViewConfig;
    } catch (e) {
      return SheetViewConfig()..aStatus = 'err: \n' + e.toString();
    }
  }

  Future save() async {
    await sheetViewConfigDb.updateSheetViewConfig(this);
  }
}

class SheetViewConfigDb {
  final Isar isar;
  SheetViewConfigDb(this.isar);

  Future init() async {}

  Future<int?> getId_(String aQuerystringKey) async {
    try {
      final int? id = await isar.sheetViewConfigs
          .filter()
          .aQuerystringKeyEqualTo(aQuerystringKey)
          .idProperty()
          .findFirst();
      return id;
    } catch (e) {
      return null;
    }
  }

  Future<SheetViewConfig?> readSheet(String aQuerystringKey) async {
    int? id = await getId_(aQuerystringKey);
    if (id == null) {
      return SheetViewConfig()
        ..aStatus = 'warn: not exists: new created'
        ..aQuerystringKey = aQuerystringKey;
    }
    SheetViewConfig? sheetViewConfig = await isar.sheetViewConfigs.get(id);
    return sheetViewConfig;
  }

  Future updateSheetViewConfig(SheetViewConfig sheetViewConfig) async {
    try {
      await isar.writeTxn((isar) async {
        sheetViewConfig.id =
            await isar.sheetViewConfigs.put(sheetViewConfig); // insert
      });
      return 'OK';
    } catch (e) {
      if (kDebugMode) print(e);
      logi('--- LocalStore: ', '-----------------isar');
      logi('updateSheetView(String ', sheetViewConfig.aQuerystringKey);
      logi('updateSheetView(String ', e.toString());
      return '';
    }
  }

  Future updateSheetsFromResponse(Map jsonData) async {
    SheetViewConfig sheetViewConfig = SheetViewConfig.fromJson(jsonData);

    try {
      await isar.writeTxn((isar) async {
        sheetViewConfig.id =
            await isar.sheetViewConfigs.put(sheetViewConfig); // insert
      });
      return 'OK';
    } catch (e) {
      if (kDebugMode) print(e);
      logi('--- LocalStore: ', '-----------------isar');
      logi('updateSheets(String ', sheetViewConfig.aQuerystringKey);
      logi('updateSheets(String ', e.toString());
      return '';
    }
  }
}
