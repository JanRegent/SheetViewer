import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/AL/views/detailView/rowmapviewer.dart';
import 'package:sheetviewer/DL/isardb/sheetrows.dart';

import 'package:sheetviewer/DL/isardb/sheetview.dart';

Future<List<PlutoRow>> gridRows(
    SheetView sheetView, BuildContext context) async {
  PlutoRow gridRow(Map row, int rowIx) {
    PlutoRow plutoRow = PlutoRow(cells: {});
    plutoRow.cells.putIfAbsent('row_', () => PlutoCell(value: row['row_']));

    for (var colIx = 0; colIx < sheetView.colsHeader.length; colIx++) {
      // ignore: unused_local_variable
      String value = '';
      try {
        value = row[sheetView.colsHeader[colIx]];
      } catch (_) {
        value = '?';
      }

      plutoRow.cells.putIfAbsent(
          sheetView.colsHeader[colIx], () => PlutoCell(value: value));
    }

    plutoRow.cells
        .putIfAbsent('__rowDetail__', () => PlutoCell(value: detailIcon()));
    return plutoRow;
  }

  List<PlutoRow> gridrows = [];

  for (var rowIx = 0; rowIx < sheetView.rows.length; rowIx++) {
    Map row = jsonDecode(sheetView.rows[rowIx]);

    gridrows.add(gridRow(row, rowIx));
  }

  return gridrows;
}

Future detailShow(
    List<SheetRow?> rows, String rowNo, BuildContext context) async {
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => RowmapViewer(rows)),
  );
}

Icon detailIcon() {
  return const Icon(
    Icons.last_page,
  );
}
