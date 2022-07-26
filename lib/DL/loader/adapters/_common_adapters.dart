import 'dart:convert';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/isardb/filelist.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

Future rawrows2db_filelist(
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
      // try {
      //   if (rowIx > 0) {
      //     await viaCsv(row);
      //   }
      // } catch (_) {}
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
