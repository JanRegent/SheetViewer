// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// import 'package:grizzly_io/src/csv/parser/parser.dart';
import 'package:csv/csv.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

Future<List<List<dynamic>>> getSheetCsv(String varname) async {
  String scvStr = await loadAssetCsv(varname);

  List<List<dynamic>> rowsAsListOfValues =
      const CsvToListConverter().convert(scvStr);
  return rowsAsListOfValues;
}
