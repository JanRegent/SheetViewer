import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../../BL/sheet/datasheet.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../BL/bl.dart';

class RowsDataSource extends DataGridSource {
  final DataSheet dataSheet;
  final BuildContext context;
  final String searchWord;

  RowsDataSource(this.dataSheet, this.context, this.searchWord) {
    _stringRowsData = gridRows(dataSheet, context);
  }

  List<DataGridRow> gridRows(DataSheet anySheet, BuildContext context) {
    List<DataGridRow> gridrows = [];

    for (var rowIx = 0; rowIx < anySheet.rows.length; rowIx++) {
      if (searchWord.isNotEmpty) {
        if (anySheet.rows[rowIx].toString().contains(searchWord)) {
          gridrows.add(gridRow(anySheet, rowIx));
        }
      } else {
        gridrows.add(gridRow(anySheet, rowIx));
      }
    }
    return gridrows;
  }

  DataGridRow gridRowSearchHelper(List<dynamic> filteredRows, int rowIx) {
    List<DataGridCell> cells = [];
    cells.add(DataGridCell<String>(
        columnName: '__leftRowMenu__', value: rowIx.toString()));
    cells.add(
        DataGridCell<String>(columnName: '__curl__', value: rowIx.toString()));
    for (var colIx = 1;
        colIx < dataSheet.config.columnsSelected.length;
        colIx++) {
      String value = '';
      try {
        value = filteredRows[rowIx][dataSheet.config.columnsSelected[colIx]];
      } catch (_) {
        value = '?';
      }
      cells.add(DataGridCell<String>(
          columnName: dataSheet.cols[colIx], value: value));
    }
    cells.add(DataGridCell<String>(
        columnName: '__rowDetail__', value: rowIx.toString()));
    DataGridRow dataGridRow = DataGridRow(cells: cells);

    return dataGridRow;
  }

  DataGridRow gridRow(DataSheet dataSheet, int rowIx) {
    List<DataGridCell> cells = [];
    cells.add(DataGridCell<String>(
        columnName: '__leftRowMenu__', value: rowIx.toString()));

    for (var colIx = 0;
        colIx < dataSheet.config.columnsSelected.length;
        colIx++) {
      String value = '';
      try {
        if (colIx == 1) {
          value = bl.blGlobal.contentServiceUrl +
              '?action=getRowsLast' +
              '&fileId=${dataSheet.rows[rowIx]['fileId']}&sheetName=${dataSheet.rows[rowIx]['sheetName']}' +
              '&rowsCount=${dataSheet.rows[rowIx]['rowsCount'].toString()}';
        } else {
          value =
              dataSheet.rows[rowIx][dataSheet.config.columnsSelected[colIx]];
        }
      } catch (e) {
        value = '?';
      }
      cells.add(DataGridCell<String>(
          columnName: dataSheet.cols[colIx], value: value));
    }
    cells.add(DataGridCell<String>(
        columnName: '__rowDetail__', value: rowIx.toString()));
    DataGridRow dataGridRow = DataGridRow(cells: cells);

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
    if (e.columnName == 'curl') {
      return IconButton(
        icon: const Icon(Icons.run_circle),
        onPressed: () => () {},
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
