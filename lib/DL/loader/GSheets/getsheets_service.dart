import 'package:gsheets/gsheets.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

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

  Future<List<String>> getAllRows(
    String fileid,
    String sheetname,
  ) async {
    Spreadsheet? ss = await getSpreadSheet(fileid);
    // ignore: unnecessary_null_comparison
    if (ss == null) return [];
    Worksheet? sheet = ss.worksheetByTitle(sheetname);
    if (sheet == null) return [];
    List<List<String>> rawRows = await sheet.values.allRows();

    cols = await columnsTitles(sheet);
    List<String> rows = [];

    for (var rowIx = 1; rowIx < rawRows.length; rowIx++) {
      Map row = {};
      for (var colIx = 0; colIx < cols.length; colIx++) {
        try {
          row[cols[colIx]] = rawRows[rowIx][colIx];
        } catch (_) {
          row[cols[colIx]] = '';
        }
      }
    }
    return rows;
  }
}
