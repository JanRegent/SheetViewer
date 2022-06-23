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

  Future getAllRows(
    String fileId,
    String sheetName,
  ) async {
    Spreadsheet? ss = await getSpreadSheet(fileId);
    // ignore: unnecessary_null_comparison
    if (ss == null) return [];
    Worksheet? sheet = ss.worksheetByTitle(sheetName);
    if (sheet == null) return [];
    List<List<String>> rawRows = await sheet.values.allRows();

    cols = await columnsTitles(sheet);

    for (var rowIx = 1; rowIx < rawRows.length; rowIx++) {
      Map row = {'row_': rowIx + 1}; //excel
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
        ..row_ = rowIx.toString()
        ..row = jsonEncode(row);
      await sheetRowsDb.update(sheetRow);
    }
  }
}
