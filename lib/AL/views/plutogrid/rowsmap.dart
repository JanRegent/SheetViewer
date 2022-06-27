import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/AL/views/detailView/rowmapviewer.dart';
import 'package:sheetviewer/DL/isardb/sheetrows.dart';

Future<List<PlutoRow>> gridRowsMap(
    List<SheetRow?> sheetRows, List<String> cols, BuildContext context) async {
  PlutoRow gridRow(SheetRow? sheetRow, int rowIx) {
    PlutoRow plutoRow = PlutoRow(cells: {});
    plutoRow.cells
        .putIfAbsent('row_', () => PlutoCell(value: sheetRow!.aRowNo));

    for (var colIx = 0; colIx < cols.length; colIx++) {
      // ignore: unused_local_variable
      String value = '';
      try {
        Map row = jsonDecode(sheetRow!.row);
        value = row[cols[colIx]];
      } catch (_) {
        value = '?';
      }

      plutoRow.cells.putIfAbsent(cols[colIx], () => PlutoCell(value: value));
    }

    plutoRow.cells
        .putIfAbsent('__rowDetail__', () => PlutoCell(value: detailIcon()));
    return plutoRow;
  }

  List<PlutoRow> gridrows = [];

  for (var rowIx = 1; rowIx < sheetRows.length; rowIx++) {
    gridrows.add(gridRow(sheetRows[rowIx], rowIx));
  }

  return gridrows;
}

Future detailShow(
    List<SheetRow?> sheetRows, String rowNo, BuildContext context) async {
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => RowmapViewer(sheetRows, rowNo)),
  );
}

Icon detailIcon() {
  return const Icon(
    Icons.last_page,
  );
}
