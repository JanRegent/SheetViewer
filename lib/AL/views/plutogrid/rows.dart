import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:sheetviewer/BL/isardb/sheetrows.dart';

Future<List<PlutoRow>> gridRowsMap(
    List<SheetRow?> sheetRows, List<String> cols) async {
  PlutoRow gridRow(SheetRow? sheetRow, int rowIx) {
    PlutoRow plutoRow = PlutoRow(cells: {});
    for (var colIx = 0; colIx < cols.length; colIx++) {
      // ignore: unused_local_variable
      String value = '';
      try {
        Map row = jsonDecode(sheetRow!.row);
        if (row[cols[colIx]] == null) {
          value = '';
        } else {
          value = row[cols[colIx]];
        }
      } catch (_) {
        value = '';
      }
      try {
        plutoRow.cells[cols[colIx]] = PlutoCell(value: value);
      } catch (e) {
        plutoRow.cells[cols[colIx]] = PlutoCell(value: '');
      }
    }

    return plutoRow;
  }

  List<PlutoRow> gridrows = [];

  for (var rowIx = 0; rowIx < sheetRows.length; rowIx++) {
    gridrows.add(gridRow(sheetRows[rowIx], rowIx));
  }

  return gridrows;
}

Icon detailIcon() {
  return const Icon(
    Icons.last_page,
  );
}
