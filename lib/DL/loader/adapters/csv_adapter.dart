// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// import 'package:grizzly_io/src/csv/parser/parser.dart';
import 'dart:convert';

import 'package:csv/csv.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/dlglobals.dart';
import 'package:sheetviewer/DL/isardb/filelist.dart';

class CsvAdapter {
  late CsvAdapter csv;

  Future<List<List<dynamic>>> getSheetCsv(String varname) async {
    String scvStr = await loadAssetCsv(varname);

    List<List<dynamic>> rowsAsListOfValues =
        const CsvToListConverter().convert(scvStr);
    return rowsAsListOfValues;
  }

  Future getInterestFilelist(String fileId, String sheetName) async {
    List<List<dynamic>> rawRows =
        await dlGlobals.csvAdapter.getSheetCsv('interestFilelist');
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
