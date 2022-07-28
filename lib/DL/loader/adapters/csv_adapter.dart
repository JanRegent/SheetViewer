// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// import 'package:grizzly_io/src/csv/parser/parser.dart';

import 'package:csv/csv.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';
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
    logi('csv_adapter', 'getSheetAllrows', sheetName + 'from: $fileLocal',
        'rawRows.length: ' + rawRows.length.toString());
    List<String> cols = bl.blUti.toListString(rawRows[0]);

    await sheetRowsDb.sheetRowsSave(rawRows, fileId, sheetName, true, cols);
    logi('csv_adapter', 'getSheetAllrows', 'sheetRowsSave',
        'rawRows.length: ' + rawRows.length.toString());
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
    logi('csv_adapter', 'getViewConfig', sheetName + 'from: $filePath',
        'rawRows.length: ' + rawRows.length.toString());

    await viewConfigsDb.fromCsv(rawRows, fileId, sheetName);
    logi('csv_adapter', 'getSheetAllrows', 'sheetRowsSave',
        'rawRows.length: ' + rawRows.length.toString());
    return rawRows.length;
  }
}
