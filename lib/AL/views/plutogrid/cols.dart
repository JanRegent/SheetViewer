import 'dart:convert';

import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/AL/views/plutogrid/drawer.dart';

List<PlutoColumn> colsMap(List<String> colsHeader) {
  List<PlutoColumn> gridCols = [];
  gridCols.add(PlutoColumn(
    title: 'RowNo',
    field: 'row_',
    width: 100,
    type: PlutoColumnType.text(),
  ));
  gridCols.first.sort = setSort('RowNo');

  for (var colIx = 0; colIx < colsHeader.length; colIx++) {
    String columnName = colsHeader[colIx];
    if (columnName == 'RowNo') continue;

    PlutoColumn col = PlutoColumn(
        title: columnName,
        field: columnName,
        type: PlutoColumnType.text(),
        readOnly: true);
    col.sort = setSort(columnName);
    gridCols.add(col);
  }

  return gridCols;
}

PlutoColumnSort setSort(String columnName) {
  try {
    Map sortMap = jsonDecode(viewHelper.viewConfig.sort);
    if (sortMap['columnName'] != columnName) return PlutoColumnSort.none;
    if (sortMap['direction'] == 'ascending') {
      return PlutoColumnSort.ascending;
    } else {
      return PlutoColumnSort.descending;
    }
  } catch (e) {
    return PlutoColumnSort.none;
  }
}

class PlutoFilterTypeExt extends PlutoFilterType {}
