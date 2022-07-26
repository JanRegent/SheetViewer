import 'dart:convert';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/isardb/filelist.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

Future rawrows2dbFilelist(
    List<List<dynamic>> rawRows, String loadAdapter) async {
  List<String> cols = bl.blUti.toListString(rawRows[0]);
  for (var rowIx = 0; rowIx < rawRows.length; rowIx++) {
    Map row = {}; //excel 1 cols, 2.. data
    for (var colIx = 0; colIx < cols.length; colIx++) {
      try {
        row[cols[colIx]] = rawRows[rowIx][colIx];
      } catch (_) {
        row[cols[colIx]] = '';
      }
    }
    String fileId = bl.blUti.url2fileid(row['fileUrl']);
    FileList fileListRow = FileList()
      ..aSheetName = row['sheetName']
      ..zfileId = fileId
      ..aRowNo = (rowIx + 1).toString() //excel start at 1
      ..row = jsonEncode(row);
    String key = row.keys.first.toString();
    if (row[key].toString().trim().isNotEmpty) {
      filelistDb.update(fileListRow);
      if (rowIx == 0) continue;
      if (loadAdapter.startsWith('local')) {
        await sheetrowsFillViaCsv(row);
      }
      if (loadAdapter.startsWith('remote')) {
        await sheetRowsFillViaGsheets(row);
      }
    }
  }
}

Future sheetrowsFillViaCsv(Map fileRow) async {
  String fileId = bl.blUti.url2fileid(fileRow['fileUrl']);
  //dataSheet
  String filePath = 'config/filelists/' +
      dlGlobals.filelistDir +
      '/local.csv/' +
      fileRow['fileLocal'];
  await dlGlobals.csvAdapter
      .getSheetAllrows(fileId, fileRow['sheetName'], filePath);

  //viewConfig?
  await dlGlobals.csvAdapter.getViewConfigLocalCsv(
      fileId, fileRow['sheetName'], fileRow['viewConfig.local']);
}

Future sheetRowsFillViaGsheets(Map fileRow) async {
  logParagraphStart('sheetRowsFill');

  String fileId = bl.blUti.url2fileid(fileRow['fileUrl']);
  String sheetName = fileRow['sheetName'];

  filelistContr.loadedSheetName.value += '\n' + sheetName;

  int rowsCount = await sheetRowsDb.rowsCount(fileId, sheetName);
  if (rowsCount > 1) return;

  await dlGlobals.gSheetsAdapter.getSheetAllRows(fileId, sheetName);
  try {
    await dlGlobals.gSheetsAdapter
        .getViewConfigGapps(fileId, sheetName, fileRow['viewConfig']);
  } catch (_) {}
}
