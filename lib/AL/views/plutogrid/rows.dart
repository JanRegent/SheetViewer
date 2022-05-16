import 'dart:convert';

import 'package:pluto_grid/pluto_grid.dart';

import 'package:sheetviewer/DL/isardb/sheetview.dart';

Future<List<PlutoRow>> gridRows(SheetView sheetView) async {
  PlutoRow gridRow(Map row, int rowIx) {
    PlutoRow plutoRow = PlutoRow(cells: {});
    for (var colIx = 0; colIx < sheetView.colsHeader.length; colIx++) {
      // ignore: unused_local_variable
      String value = '';
      try {
        value = row[sheetView.colsHeader[colIx]];
      } catch (_) {
        value = '?';
      }

      plutoRow.cells
          .putIfAbsent(sheetView.cols[colIx], () => PlutoCell(value: value));
    }
    plutoRow.cells
        .putIfAbsent('__rowDetail__', () => PlutoCell(value: rowIx.toString()));

    return plutoRow;
  }

  List<PlutoRow> gridrows = [];

  for (var rowIx = 0; rowIx < sheetView.rows.length; rowIx++) {
    Map row = jsonDecode(sheetView.rows[rowIx]);

    gridrows.add(gridRow(row, rowIx));
  }

  return gridrows;
}
