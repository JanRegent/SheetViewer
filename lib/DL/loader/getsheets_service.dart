import 'package:gsheets/gsheets.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

class GetSheetsService {
  late GSheets gsheets;

  Future init() async {
    // init GSheets
    gsheets = GSheets(dlGlobals.kredenc);
  }

  Future<Worksheet?> getWorksheet(String fileId, String sheetName) async {
    // fetch spreadsheet by its id
    final ss = await gsheets.spreadsheet(fileId);
    // ignore: unnecessary_null_comparison
    if (ss == null) {
      return null;
    }

    try {
      // get worksheet by its title
      Worksheet? sheet = ss.worksheetByTitle(sheetName);
      return sheet;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future getSheetRow(String fileId, String sheetName) async {
    Worksheet? worksheet = await getWorksheet(fileId, sheetName);

    int? len = 76;
    //worksheet?.rowCount;
    //print('len ' + len.toString());
    for (var i = 1; i < len; i++) {
      final cell = await worksheet?.cells.cell(column: 2, row: i);
      print(cell?.value);
    }
  }
}
