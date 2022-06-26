import 'dart:convert';

import 'package:gsheets/gsheets.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/dlglobals.dart';
import 'package:sheetviewer/DL/isardb/sheetrows.dart';

class GetSheetsService {
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

  Future getSheetAllRows(String fileId, String sheetName, bool putAll) async {
    late Worksheet? sheet;
    try {
      Spreadsheet? ss = await getSpreadSheet(fileId);
      // ignore: unnecessary_null_comparison
      if (ss == null) return [];
      sheet = ss.worksheetByTitle(sheetName);
      if (sheet == null) return [];
    } catch (e) {
      SheetRow sheetRow = SheetRow()
        ..aSheetName = sheetName
        ..zfileId = fileId
        ..aRowNo = (1).toString() //excel start at 1
        ..row = jsonEncode('{"warning":"$e"}');

      await sheetRowsDb.update(sheetRow);
      return [];
    }
    List<List<String>> rawRows = await sheet.values.allRows();

    cols = await columnsTitles(sheet);
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
        ..aRowNo = (rowIx + 1).toString() //excel start at 1
        ..row = jsonEncode(row);
      String key = row.keys.first.toString();
      if (row[key].toString().trim().isNotEmpty) {
        if (putAll) {
          //>1000 rows
          sheetRows.add(sheetRow); //empty rows //workarround
        } else {
          sheetRowsDb.update(sheetRow);
        }
      }
    }
    if (putAll) await sheetRowsDb.updateAll(sheetRows);
  }
}
