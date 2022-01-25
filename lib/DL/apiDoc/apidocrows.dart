import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sheetviewer/BL/sheet/sheet_config.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'apidoccols.dart';

class RowsDataSource extends DataGridSource {
  final SheetConfig sheetConfig;
  final BuildContext context;
  final String endpointName;
  final String searchWord;

  RowsDataSource(
      this.sheetConfig, this.context, this.searchWord, this.endpointName) {
    _stringRowsData = gridRows(sheetConfig, context);
  }

  List<DataGridRow> gridRows(SheetConfig sheetConfig, BuildContext context) {
    Set columns = columnsGetUsed(sheetConfig);
    List<DataGridRow> gridrows = [];
    for (var rowIx = 0; rowIx < sheetConfig.getRows.length; rowIx++) {
      gridrows.add(gridRow(columns, sheetConfig.getRows, rowIx));
    }
    return gridrows;
  }

  DataGridRow gridRow(Set columns, List<String> values, int rowIx) {
    List<DataGridCell> cells = [];
    cells.add(DataGridCell<String>(
        columnName: '__leftRowMenu__', value: rowIx.toString()));

    Map row = jsonDecode(values[rowIx]);
    for (var column in columns) {
      String value = '';
      try {
        value = row[column].toString();
      } catch (e) {
        value = row[column] ?? '';
      }
      value = value.replaceAll('null', '');
      cells.add(DataGridCell<String>(columnName: column, value: value));
    }

    cells.add(DataGridCell<String>(
        columnName: '__rowDetail__', value: rowIx.toString()));
    DataGridRow dataGridRow = DataGridRow(
      cells: cells,
    );

    return dataGridRow;
  }

  List<DataGridRow> _stringRowsData = [];

  @override
  List<DataGridRow> get rows => _stringRowsData;

  ReadMoreText readmoreText(String value) {
    return ReadMoreText(
      value,
      trimLines: 2,
      colorClickableText: Colors.pink,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }

  Widget getCell(DataGridCell<dynamic> e, int rowIx) {
    if (e.columnName == '__rowDetail__') {
      return IconButton(
        icon: const Icon(Icons.chevron_right),
        onPressed: () => detailShow(rowIx),
      );
    }

    return readmoreText(e.value.toString());
  }

  Future detailShow(int rowIx) async {
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => DetailListViewPage(dataSheet, rowIx)),
    // );
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      int rowIx = int.tryParse(row.getCells().first.value.toString())!;
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: getCell(e, rowIx),
      );
    }).toList());
  }
}
