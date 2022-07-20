import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/AL/views/plutogrid/drawergrid.dart';

List<PlutoColumn> colsMap(List<String> colsHeader) {
  List<PlutoColumn> gridCols = [];

  for (var colIx = 0; colIx < colsHeader.length; colIx++) {
    String columnName = colsHeader[colIx];

    PlutoColumn col = PlutoColumn(
        title: columnName,
        field: columnName,
        type: PlutoColumnType.text(),
        readOnly: true);
    col.sort = viewHelper.setSort(columnName);
    col.frozen = viewHelper.setFreeze(columnName);
    gridCols.add(col);
  }

  return gridCols;
}

class PlutoFilterTypeExt extends PlutoFilterType {}
