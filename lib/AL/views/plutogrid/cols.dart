import 'package:pluto_grid/pluto_grid.dart';

List<PlutoColumn> colsMap(List<String> colsHeader) {
  List<PlutoColumn> gridCols = [];
  gridCols.add(PlutoColumn(
    title: 'RowNo',
    field: 'row_',
    width: 60,
    type: PlutoColumnType.text(),
  ));

  for (var colIx = 0; colIx < colsHeader.length; colIx++) {
    PlutoColumn col = PlutoColumn(
        title: colsHeader[colIx],
        field: colsHeader[colIx],
        type: PlutoColumnType.text(),
        readOnly: true);

    gridCols.add(col);
  }

  return gridCols;
}

Future<List<PlutoColumn>> colsHeaderMap(List<String> colsHeader) async {
  List<PlutoColumn> gridCols = [];
  gridCols.add(PlutoColumn(
    title: 'RowNo',
    field: 'row_',
    width: 60,
    type: PlutoColumnType.text(),
  ));

  for (var colIx = 0; colIx < colsHeader.length; colIx++) {
    PlutoColumn col = PlutoColumn(
        title: colsHeader[colIx],
        field: colsHeader[colIx],
        type: PlutoColumnType.text(),
        readOnly: true);

    gridCols.add(col);
  }

  return gridCols;
}

class PlutoFilterTypeExt extends PlutoFilterType {}
