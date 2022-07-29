// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// import 'package:grizzly_io/src/csv/parser/parser.dart';

import 'package:csv/csv.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

class CsvAdapter {
  late CsvAdapter csv;

  Future<List<List<dynamic>>> getSheetCsv(String varname) async {
    String scvStr = await loadAssetCsv(varname);

    List<List<dynamic>> rowsAsListOfValues =
        const CsvToListConverter().convert(scvStr);
    return rowsAsListOfValues;
  }

  Future<List<List<dynamic>>> getFilelistDynamic() async {
    List<List<dynamic>> rawRows = await dlGlobals.csvAdapter.getSheetCsv(
        'config/local.csv/' +
            appConfigDb.filelistSheetName +
            '/__filelist__.csv');
    return rawRows;
  }

  Future getSheetAllrows(
      String fileId, String sheetName, String fileLocal) async {
    List<List<dynamic>> rawRows =
        await dlGlobals.csvAdapter.getSheetCsv(fileLocal);
    List<String> cols = bl.blUti.toListString(rawRows[0]);

    await sheetRowsDb.sheetRowsSave(rawRows, fileId, sheetName, true, cols);
    return rawRows.length;
  }

  Future getViewConfigLocalCsv(
      String fileId, String sheetName, String vievConfigSheetName) async {
    if (vievConfigSheetName.isEmpty) return;

    String filePath = 'config/local.csv/' +
        appConfigDb.filelistSheetName +
        '/' +
        vievConfigSheetName +
        '.csv';
    List<List<dynamic>> rawRows =
        await dlGlobals.csvAdapter.getSheetCsv(filePath);

    await viewConfigsDb.fromCsv(rawRows, fileId, sheetName);

    return rawRows.length;
  }
}
