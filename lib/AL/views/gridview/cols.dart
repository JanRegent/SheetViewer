import 'package:flutter/material.dart';
import '../../../BL/sheet/datasheet.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<GridColumn> colsHeader(DataSheet anySheet) {
  List<GridColumn> gridCols = [];
  gridCols.add(GridColumn(
      columnName: 'S',
      width: 50,
      label: Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child:
              IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit)))));
  for (var colIx = 0; colIx < anySheet.columnsSelected.length; colIx++) {
    gridCols.add(GridColumn(
        columnName: anySheet.columnsSelected[colIx],
        label: Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              anySheet.columnsSelected[colIx],
            ))));
  }
  return gridCols;
}
