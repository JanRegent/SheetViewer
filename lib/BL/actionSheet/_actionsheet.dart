import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';
import 'package:sheetviewer/DL/models/sheetview.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

import '../../DL/models/sheetconfig.dart';

part '../../DL/sheetview_getdata.dart';

class ActionSheet {
  String fileId = '';
  String sheetName = '';
  Map queryMap = {};

  ActionSheet();

  List<String> cols = [];
  List<String> headerCols = [];

  List<dynamic> rows = [];

  //temp
  String sheetTitle = '';
  Map rawDataSheet = {};

  factory ActionSheet.fromSheet(SheetView sheet) {
    try {
      ActionSheet dataSheet = ActionSheet()..cols = sheet.cols;

      for (var i = 0; i < sheet.rows.length; i++) {
        dataSheet.rows.add(jsonDecode(sheet.rows[i]));
      }

      dataSheet.headerCols = dataSheet.cols;

      return dataSheet;
    } catch (e) {
      return ActionSheet();
    }
  }

  factory ActionSheet.fromJson(Map jsonData) {
    try {
      List<String> cols = List<String>.from(jsonData["cols"]);

      ActionSheet anySheet = ActionSheet()
        ..cols = cols
        ..rows = jsonData["rows"];

      anySheet.headerCols = jsonData["headerCols"] ?? cols;
      anySheet.rawDataSheet = jsonData;

      return anySheet;
    } catch (e) {
      return ActionSheet();
    }
  }

  @override
  String toString() {
    return ''' 
    ------------------------------------------datasheet
    cols:            $cols

    row1:            ${printMap(rows[0])} 
    
    rowN:            ${printMap(rows[rows.length - 1])} 
    
    ''';
  }

  String printMap(Map row) {
    String str = '';
    for (var entry in row.entries) {
      str += '\n ${entry.key}:  ${entry.value}';
    }
    return str;
  }

  Future<Map> actionMapFind(
      String fileId, String sheetName, String action) async {
    String sheetKey = SheetConfig().getKey(sheetName, fileId);
    SheetConfig? sheetConfig = await sheetConfigDb.readSheet(sheetKey);
    Map getRowsMap = {"action": action, "rowsCount": 10};
    for (var i = 0; i < sheetConfig!.getRows.length; i++) {
      Map map = jsonDecode(sheetConfig.getRows[i]);
      if (map['action'] == action) {
        getRowsMap = map;
        break;
      }
    }
    return getRowsMap;
  }
}
