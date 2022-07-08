import 'dart:convert';

import 'package:gsheets/gsheets.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/dlglobals.dart';
import 'package:sheetviewer/DL/isardb/filelist.dart';
import 'package:sheetviewer/DL/isardb/sheetrows.dart';
import 'package:sheetviewer/DL/loader/csv/csvloader.dart';

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

  Future getSheetAllRows(
      String fileId, String sheetName, bool putAll, String db) async {
    late Worksheet? sheet;
    try {
      Spreadsheet? ss = await getSpreadSheet(fileId);
      // ignore: unnecessary_null_comparison
      if (ss == null) return [];
      sheet = ss.worksheetByTitle(sheetName);
      if (sheet == null) return [];
    } catch (e) {
      if (db == 'sheetRowsDb') {
        SheetRow sheetRow = SheetRow()
          ..aSheetName = sheetName
          ..zfileId = fileId
          ..aRowNo = 2 //excel start at 1
          ..row = jsonEncode({"warning": "warning"});
        await sheetRowsDb.update(sheetRow);
      } else {
        FileList fileListRow = FileList()
          ..aSheetName = sheetName
          ..zfileId = fileId
          ..aRowNo = (1).toString() //excel start at 1
          ..row = jsonEncode({"warning": "warning"});
        await filelistDb.update(fileListRow);
      }
      return [];
    }
    List<List<String>> rawRows = await sheet.values.allRows();

    cols = await columnsTitles(sheet);
    if (db == 'sheetRowsDb') {
      await sheetRowsSave(rawRows, fileId, sheetName, putAll);
    }
    if (db == 'filelistDb') await filelistSave(rawRows, fileId, sheetName);
  }

  Future filelistSave(
      List<List<dynamic>> rawRows, String fileId, String sheetName) async {
    {
      for (var rowIx = 0; rowIx < rawRows.length; rowIx++) {
        interestContr.fetshingRows.value = sheetName +
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

  Future getSheetAllRowsCsv(String sheetName) async {
    String fileId = 'localCSV';
    List<List<dynamic>> rawRows = await getSheetCsv('interestFilelist');
    List<String> cols = bl.blUti.toListString(rawRows[0]);

    for (var rowIx = 0; rowIx < rawRows.length; rowIx++) {
      interestContr.fetshingRows.value =
          sheetName + ': ' + rowIx.toString() + '/' + rawRows.length.toString();
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

  Future sheetRowsSave(List<List<String>> rawRows, String fileId,
      String sheetName, bool putAll) async {
    List<SheetRow> sheetRows = [];
    for (var rowIx = 0; rowIx < rawRows.length; rowIx++) {
      interestContr.fetshingRows.value =
          sheetName + ': ' + rowIx.toString() + '/' + rawRows.length.toString();
      Map row = {}; //excel 1 cols, 2.. data
      for (var colIx = 0; colIx < cols.length; colIx++) {
        try {
          row[cols[colIx]] = rawRows[rowIx][colIx];
        } catch (_) {
          row[cols[colIx]] = '';
        }
      }
      SheetRow sheetRow = SheetRow()
        ..aSheetName = sheetName
        ..zfileId = fileId
        ..aRowNo = (rowIx + 1) //excel start at 1
        ..row = jsonEncode(row);
      String key = row.keys.first.toString();
      if (row[key].toString().trim().isNotEmpty) {
        if (putAll) {
          //>1000 rows
          sheetRows.add(sheetRow); //empty rows //workarround
        } else {
          await sheetRowsDb.update(sheetRow);
        }
      }
    }
    if (putAll) await sheetRowsDb.updateAll(sheetRows);
  }
}
