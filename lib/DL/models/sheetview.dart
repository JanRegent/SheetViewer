import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'package:sheetviewer/BL/lib/blglobal.dart';

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
  List<String> colsHeader = [];
  List<String> rows = [];

  @Ignore()
  Map rawDataSheet = {};

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

      SheetView sheet = SheetView()
        ..cols = cols
        ..aQuerystringKey = jsonData["config"]["queryString"] ?? '';

      List<String> rows = bl.blUti.toListString(jsonData["rows"]);
      for (var i = 0; i < rows.length; i++) {
        sheet.rows.add(jsonEncode(rows[i]));
      }

      sheet.sheetName = jsonData["config"]["sheetName"] ?? '';
      sheet.fileId = jsonData["config"]["fileId"] ?? '';
      sheet.fileUrl = jsonData["config"]["fileUrl"] ?? '';
      sheet.copyrightUrl = jsonData["config"]["copyrightUrl"] ?? '';
      sheet.colsHeader = jsonData["headerCols"] ?? cols;
      sheet.rawDataSheet = jsonData;

      return sheet;
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
          await isar.sheets.where().filter().idGreaterThan(0).findAll();

      for (var i = 0; i < all.length; i++) {
        String cacheKey = all[i].aQuerystringKey;
        if (!ids.keys.contains(cacheKey)) ids[cacheKey] = all[i].id;
      }
    } catch (_) {}
  }

  Future<int> keysCount(String querystringKey) async {
    final sheetExists =
        isar.sheets.where().filter().aQuerystringKeyEqualTo(querystringKey);
    int count = await sheetExists.count();
    return count;
  }

  Future<int?> getId_(String aQuerystringKey) async {
    try {
      final int? id = await isar.sheets
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
    SheetView? sheet = await isar.sheets.get(id);
    //sheet?.aQuerystringKey = querystringKey;
    return sheet;
  }

  Future updateSheets(
      String cacheKey, List<String> cols, List<dynamic> rows) async {
    int keyCount_ = await keysCount(cacheKey);
    if (keyCount_ > 0) {
      return 'OK';
    }
    SheetView sheet = SheetView()
      ..aQuerystringKey = cacheKey
      ..cols = cols;
    for (var i = 0; i < rows.length; i++) {
      sheet.rows.add(jsonEncode(rows[i]));
    }
    try {
      await isar.writeTxn((isar) async {
        sheet.id = await isar.sheets.put(sheet); // insert
      });
      return 'OK';
    } catch (e) {
      if (kDebugMode) print(e);
      logi('--- LocalStore: ', '-----------------isar');
      logi('updateSheets(String ', cacheKey);
      logi('updateSheets(String ', e.toString());
      return '';
    }
  }

  Future updateSheetsFromResponse(Map jsonData) async {
    SheetView sheet = SheetView.fromJson(jsonData);

    try {
      await isar.writeTxn((isar) async {
        sheet.id = await isar.sheets.put(sheet); // insert
      });
      return 'OK';
    } catch (e) {
      if (kDebugMode) print(e);
      logi('--- LocalStore: ', '-----------------isar');
      logi('updateSheets(String ', sheet.aQuerystringKey);
      logi('updateSheets(String ', e.toString());
      return '';
    }
  }
}
