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
  String getRowsLast = '';
  String getRowsFirst = '';
  String getRowsFrom = '';
  String getRowsTo = '';

  @Ignore()
  Map fileListSheetRow = {};
  @Ignore()
  String fileId = '';
  @Ignore()
  String sheetName = '';

  SheetViewConfig();

  @override
  String toString() {
    return '''
  ----------------------------------------------------------------------shetView
  id $id
  aQuerystringKey $aQuerystringKey
  aStatus         $aStatus

  colsHeader      $colsHeader
  getRowsFirst    $getRowsFirst
  getRowsLast     $getRowsLast


    ''';
  }

  factory SheetViewConfig.fromJson(Map jsonData) {
    try {
      SheetViewConfig sheetViewConfig = SheetViewConfig()
        ..aQuerystringKey = jsonData["config"]["queryStringKey"] ?? '';

      sheetViewConfig.colsHeader = jsonData["colsHeader"] ?? '';
      sheetViewConfig.getRowsFirst = jsonData["getRowsFirst"] ?? 10;
      sheetViewConfig.getRowsLast = jsonData["getRowsLast"] ?? 10;

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

  Future colsHeaderSave(String aQuerystringKey, List<String> colsHeader) async {
    SheetViewConfig? sheetViewConfig = await readSheet(aQuerystringKey);
    sheetViewConfig?.colsHeader = colsHeader.join('__|__');
    await sheetViewConfigDb.updateSheetViewConfig(sheetViewConfig!);
  }

  Future getRowsSave(
      String aQuerystringKey, String varName, String rowsCount) async {
    SheetViewConfig? sheetViewConfig =
        await sheetViewConfigDb.readSheet(aQuerystringKey);
    if (varName == 'getRowsFirst') sheetViewConfig?.getRowsFirst = rowsCount;
    if (varName == 'getRowsLast') sheetViewConfig?.getRowsLast = rowsCount;
    updateSheetViewConfig(sheetViewConfig!);
  }
}
