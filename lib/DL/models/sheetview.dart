import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

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
  SheetViewConfig sheetViewConfig = SheetViewConfig();

  @Ignore()
  int currentRowsIndex = 0;

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


    ''';
  }

  factory SheetView.fromJson(Map jsonData) {
    try {
      List<String> cols = List<String>.from(jsonData["cols"]);

      SheetView sheetView = SheetView()..cols = cols;
      sheetView.colsHeader = cols;

      //List<String> rows = bl.blUti.toListString(jsonDecode(jsonData["rows"]));

      List<dynamic> rows = jsonData["rows"];
      for (var i = 0; i < rows.length; i++) {
        String row = jsonEncode(rows[i]); //map to String workarround of Isar
        sheetView.rows.add(row);
      }

      sheetView.sheetName = jsonData["config"]["sheetName"] ?? '';
      sheetView.fileId = jsonData["config"]["fileId"] ?? '';
      sheetView.fileUrl = jsonData["config"]["fileUrl"] ?? '';
      sheetView.copyrightUrl = jsonData["config"]["copyrightUrl"] ?? '';
      sheetView.colsHeader = jsonData["headerCols"] ?? cols;

      return sheetView;
    } catch (e) {
      return SheetView()..aStatus = 'err: \n' + e.toString();
    }
  }
}

class SheetsDb {
  final Isar isar;
  SheetsDb(this.isar);

  Future init() async {}

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

  Future updateSheetsFromResponse(Map jsonData, String queryStringKey) async {
    SheetView sheetView = SheetView.fromJson(jsonData);
    sheetView.aQuerystringKey = queryStringKey;
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

  Future deleteSheet(String aQuerystringKey) async {
    int? id = await getId_(aQuerystringKey);
    if (id == null) {
      return;
    }

    await isar.writeTxn((isar) async {
      await isar.sheetViews.delete(id);
    });
  }
}
