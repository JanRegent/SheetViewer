import 'dart:convert';

import 'package:gsheets/gsheets.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/DL/dlglobals.dart';
import 'package:sheetviewer/BL/isardb/filelist.dart';
import 'package:sheetviewer/BL/isardb/sheetrows.dart';

class GSheetsAdapter {
  late GSheets gsheets;

  Future init() async {
    // init GSheets
    gsheets = GSheets(dlGlobals.kredenc);
  }

  List<String> cols = [];

  Future<Spreadsheet?> getSpreadSheet(String fileId) async {
    // fetch spreadsheet by its id
    final ss = await gsheets.spreadsheet(fileId);
    // ignore: unnecessary_null_comparison
    if (ss == null) {
      return null;
    }
    return ss;
  }

  Future<List<String>> columnsTitles(Worksheet sheet) async {
    return await sheet.values.row(1);
  }

  Future<String> columnsTitlesJoined(Worksheet sheet) async {
    List<String> list = await sheet.values.row(1);
    String cols = list[0];
    for (int colIx = 1; colIx < list.length; colIx++) {
      cols += "," + list[colIx];
    }
    return cols;
  }

  Future<int> getSheetAllRowsOld(
      String fileId, String sheetName, bool putAll, String db) async {
    late Worksheet? sheet;
    try {
      Spreadsheet? ss = await getSpreadSheet(fileId);
      // ignore: unnecessary_null_comparison
      if (ss == null) return 0;
      sheet = ss.worksheetByTitle(sheetName);
      if (sheet == null) return 0;
    } catch (e) {
      if (db == 'sheetRowsDb') {
        SheetRow sheetRow = SheetRow()
          ..aSheetName = sheetName
          ..zfileId = fileId
          ..aRowNo = 2 //excel start at 1
          ..row = jsonEncode({'warning': e.toString()});
        await sheetRowsDb.update(sheetRow);
      } else {
        FileList fileListRow = FileList()
          ..aSheetName = sheetName
          ..zfileId = fileId
          ..aRowNo = (1).toString() //excel start at 1
          ..row = jsonEncode({'warning': e.toString()});
        await filelistDb.update(fileListRow);
      }
      return 0;
    }
    List<List<String>> rawRows = await sheet.values.allRows();

    cols = await columnsTitles(sheet);
    if (db == 'sheetRowsDb') {
      await sheetRowsDb.sheetRowsSave(rawRows, fileId, sheetName, putAll, cols);
    }
    if (db == 'filelistDb') await filelistSave(rawRows, fileId, sheetName);

    return rawRows.length;
  }

  Future<int> getSheetAllRows(
    String fileId,
    String sheetName,
  ) async {
    late Worksheet? sheet;
    try {
      Spreadsheet? ss = await getSpreadSheet(fileId);
      // ignore: unnecessary_null_comparison
      if (ss == null) return 0;
      sheet = ss.worksheetByTitle(sheetName);
      if (sheet == null) return 0;
    } catch (e) {
      SheetRow sheetRow = SheetRow()
        ..aSheetName = sheetName
        ..zfileId = fileId
        ..aRowNo = 2 //excel start at 1
        ..row = jsonEncode({'warning': e.toString()});
      await sheetRowsDb.update(sheetRow);

      return 0;
    }
    List<List<String>> rawRows = await sheet.values.allRows();

    cols = await columnsTitles(sheet);
    await sheetRowsDb.sheetRowsSave(rawRows, fileId, sheetName, true, cols);

    return rawRows.length;
  }

  Future<int> getViewConfigGapps(
      String fileId, String sheetName, String viewConfig) async {
    if (viewConfig.isEmpty) return 0;
    logi('getSheetViewConfig', 'viewConfig sheetName ', viewConfig, '');
    late Worksheet? sheet;
    try {
      Spreadsheet? ss = await getSpreadSheet(fileId);
      // ignore: unnecessary_null_comparison
      if (ss == null) return 0;
      sheet = ss.worksheetByTitle(viewConfig);
      if (sheet == null) return 0;
    } catch (e) {
      logi('getSheetViewConfig', 'err\n ', e, '');
      return 0;
    }
    List<List<String>> rawRows = await sheet.values.allRows();

    await viewConfigsDb.fromCsv(rawRows, fileId, sheetName);

    return rawRows.length;
  }

  Future filelistSave(
      List<List<dynamic>> rawRows, String fileId, String sheetName) async {
    {
      for (var rowIx = 0; rowIx < rawRows.length; rowIx++) {
        filelistContr.fetshingRows.value = sheetName +
            ': ' +
            rowIx.toString() +
            '/' +
            rawRows.length.toString();
        Map row = {}; //excel 1 cols, 2.. data
        for (var colIx = 0; colIx < cols.length; colIx++) {
          try {
            row[cols[colIx]] = rawRows[rowIx][colIx];
          } catch (_) {
            row[cols[colIx]] = '';
          }
        }
        FileList fileListRow = FileList()
          ..aSheetName = sheetName
          ..zfileId = fileId
          ..aRowNo = (rowIx + 1).toString() //excel start at 1
          ..row = jsonEncode(row);
        String key = row.keys.first.toString();
        if (row[key].toString().trim().isNotEmpty) {
          filelistDb.update(fileListRow);
        }
      }
    }
  }
}
