import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'package:sheetviewer/BL/lib/blglobal.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

part 'sheetview.g.dart'; // flutter pub run build_runner build

@Collection()
class SheetView {
  int id = Isar.autoIncrement;
  String aQuerystringKey = '';
  String aStatus = '';

  String sheetName = '';
  String fileId = '';
  String fileUrl = '';
  String copyrightUrl = '';

  List<String> cols = [];
  @Ignore()
  List<String> colsHeader = [];
  List<String> rows = [];

  @Ignore()
  Map rawDataSheet = {};

  @Ignore()
  SheetViewConfig sheetViewConfig = SheetViewConfig();

  SheetView();

  @override
  String toString() {
    return '''
  ----------------------------------------------------------------------shetView
  id $id
  aQuerystringKey $aQuerystringKey
  aStatus         $aStatus

  sheetName       $sheetName
  fileId          $fileId
  fileUrl         $fileUrl
  copyrightUrl    $copyrightUrl

  cols
    $cols      
  colsHeader
    $colsHeader
  
  rows
    $rows

  @Ignore()
  rawDataSheet
    $rawDataSheet

    ''';
  }

  factory SheetView.fromJson(Map jsonData) {
    try {
      List<String> cols = List<String>.from(jsonData["cols"]);

      SheetView sheetView = SheetView()
        ..cols = cols
        ..aQuerystringKey = jsonData["config"]["queryString"] ?? '';

      sheetView.colsHeader = cols;

      List<String> rows = bl.blUti.toListString(jsonData["rows"]);
      for (var i = 0; i < rows.length; i++) {
        sheetView.rows.add(jsonEncode(rows[i]));
      }

      sheetView.sheetName = jsonData["config"]["sheetName"] ?? '';
      sheetView.fileId = jsonData["config"]["fileId"] ?? '';
      sheetView.fileUrl = jsonData["config"]["fileUrl"] ?? '';
      sheetView.copyrightUrl = jsonData["config"]["copyrightUrl"] ?? '';
      sheetView.colsHeader = jsonData["headerCols"] ?? cols;
      sheetView.rawDataSheet = jsonData;

      return sheetView;
    } catch (e) {
      return SheetView()..aStatus = 'err: \n' + e.toString();
    }
  }
}

class SheetsDb {
  final Isar isar;
  SheetsDb(this.isar);

  Future init() async {
    await idsBuild();
  }

  Map<String, int> ids = {};
  Future idsBuild() async {
    try {
      List<SheetView> all =
          await isar.sheetViews.where().filter().idGreaterThan(0).findAll();

      for (var i = 0; i < all.length; i++) {
        String cacheKey = all[i].aQuerystringKey;
        if (!ids.keys.contains(cacheKey)) ids[cacheKey] = all[i].id;
      }
    } catch (_) {}
  }

  Future<int> keysCount(String querystringKey) async {
    final sheetExists =
        isar.sheetViews.where().filter().aQuerystringKeyEqualTo(querystringKey);
    int count = await sheetExists.count();
    return count;
  }

  Future<int?> getId_(String aQuerystringKey) async {
    try {
      final int? id = await isar.sheetViews
          .filter()
          .aQuerystringKeyEqualTo(aQuerystringKey)
          .idProperty()
          .findFirst();
      return id;
    } catch (e) {
      return null;
    }
  }

  Future<SheetView?> readSheet(String aQuerystringKey) async {
    int? id = await getId_(aQuerystringKey);
    if (id == null) {
      return SheetView()..aStatus = 'warn: not exists: $aQuerystringKey';
    }
    SheetView? sheet = await isar.sheetViews.get(id);
    return sheet;
  }

  Future updateSheetView(SheetView sheetView) async {
    try {
      await isar.writeTxn((isar) async {
        sheetView.id = await isar.sheetViews.put(sheetView); // insert
      });
      return 'OK';
    } catch (e) {
      if (kDebugMode) print(e);
      logi('--- LocalStore: ', '-----------------isar');
      logi('updateSheetView(String ', sheetView.aQuerystringKey);
      logi('updateSheetView(String ', e.toString());
      return '';
    }
  }

  Future updateSheetsFromResponse(Map jsonData) async {
    SheetView sheetView = SheetView.fromJson(jsonData);

    try {
      await isar.writeTxn((isar) async {
        sheetView.id = await isar.sheetViews.put(sheetView); // insert
      });
    } catch (e) {
      if (kDebugMode) print(e);
      logi('--- LocalStore: ', '-----------------isar');
      logi('updateSheets(String ', sheetView.aQuerystringKey);
      logi('updateSheets(String ', e.toString());
    }

    try {
      SheetViewConfig sheetViewConfig = SheetViewConfig()
        ..aQuerystringKey = sheetView.aQuerystringKey;

      sheetViewConfig.colsHeader = sheetView.colsHeader.join('__|__');

      await isar.writeTxn((isar) async {
        sheetView.id =
            await isar.sheetViewConfigs.put(sheetViewConfig); // insert
      });
      return 'OK';
    } catch (e) {
      if (kDebugMode) print(e);
      logi('--- LocalStore: ', '-----------------isar');
      logi('updateSheets(String ', sheetView.aQuerystringKey);
      logi('updateSheets(String ', e.toString());
      return '';
    }
  }
}
