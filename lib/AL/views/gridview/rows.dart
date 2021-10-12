// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../../../BL/sheet/datasheet.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class RowsDataSource extends DataGridSource {
  final DataSheet anySheet;

  RowsDataSource(this.anySheet) {
    _stringRowsData = gridRows(anySheet);
  }

  List<DataGridRow> gridRows(DataSheet anySheet) {
    List<DataGridRow> gridrows = [];
    for (var rowIx = 0; rowIx < anySheet.rows.length; rowIx++) {
      gridrows.add(gridRow(anySheet, rowIx));
    }
    return gridrows;
  }

  DataGridRow gridRow(DataSheet anySheet, int rowIx) {
    List<DataGridCell> cells = [];
    cells.add(DataGridCell<String>(columnName: 'S', value: rowIx.toString()));
    for (var colIx = 0; colIx < anySheet.columnsSelected.length; colIx++) {
      String value = '';
      try {
        value = anySheet.rows[rowIx][anySheet.columnsSelected[colIx]];
      } catch (_) {
        value = '?';
      }
      cells.add(
          DataGridCell<String>(columnName: anySheet.cols[colIx], value: value));
    }
    DataGridRow dataGridRow = DataGridRow(cells: cells);
    return dataGridRow;
  }

  List<DataGridRow> _stringRowsData = [];

  @override
  List<DataGridRow> get rows => _stringRowsData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {},
          onDoubleTap: () {
            print(e.columnName);
            print(e.value);
          },
          onLongPress: () {},
          child: Text(e.value.toString()),
        ),
      );
    }).toList());
  }
}
