// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// import 'package:grizzly_io/src/csv/parser/parser.dart';
import 'dart:convert';

import 'package:csv/csv.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/DL/dlglobals.dart';
import 'package:sheetviewer/BL/isardb/filelist.dart';

class CsvAdapter {
  late CsvAdapter csv;

  Future<List<List<dynamic>>> getSheetCsv(String varname) async {
    String scvStr = await loadAssetCsv(varname);

    List<List<dynamic>> rowsAsListOfValues =
        const CsvToListConverter().convert(scvStr);
    return rowsAsListOfValues;
  }

  Future getFilelistDynamic() async {
    List<List<dynamic>> rawRows = await dlGlobals.csvAdapter.getSheetCsv(
        'config/filelists/' +
            dlGlobals.filelistDir +
            '/local.csv/__filelist__.csv');
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
        try {
          if (rowIx > 0) {
            await viaCsv(row);
          }
        } catch (_) {}
      }
    }
  }

  Future viaCsv(Map fileRow) async {
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
      String fileId, String sheetName, String fileLocalNoPath) async {
    if (fileLocalNoPath.isEmpty) return;

    String filePath = 'config/filelists/' +
        dlGlobals.filelistDir +
        '/local.csv/' +
        fileLocalNoPath;
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
