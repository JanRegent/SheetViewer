import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:substring_highlight/substring_highlight.dart';

import 'package:sheetviewer/DL/models/sheetview.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../detailView/DetailListViewPage.dart';

class RowsDataSource extends DataGridSource {
  final SheetView sheetView;
  final BuildContext context;
  final String searchWord;
  final String searchInColumn;

  RowsDataSource(
      this.sheetView, this.context, this.searchWord, this.searchInColumn) {
    _stringRowsData = gridRows(sheetView, context);
  }

  List<DataGridRow> gridRows(SheetView sheetView, BuildContext context) {
    List<DataGridRow> gridrows = [];

    for (var rowIx = 0; rowIx < sheetView.rows.length; rowIx++) {
      Map row = jsonDecode(sheetView.rows[rowIx]);

      if (searchWord.isNotEmpty) {
        if (searchInColumn != '__all__') {
          if (row[searchInColumn].toString().contains(searchWord)) {
            gridrows.add(gridRow(row, rowIx));
          }
          continue;
        }

        for (var e in row.entries) {
          if (e.value.toString().contains(searchWord)) {
            gridrows.add(gridRow(row, rowIx));
            break;
          }
        }
        continue;
      }
      gridrows.add(gridRow(row, rowIx));
    }
    return gridrows;
  }

  DataGridRow gridRowSearchHelper(List<dynamic> filteredRows, int rowIx) {
    List<DataGridCell> cells = [];
    cells.add(DataGridCell<String>(
        columnName: '__leftRowMenu__', value: rowIx.toString()));
    Map row = jsonDecode(filteredRows[rowIx]);
    for (var colIx = 0; colIx < sheetView.colsHeader.length; colIx++) {
      String value = '';
      try {
        value = row[sheetView.colsHeader[colIx]];
      } catch (_) {
        value = '?';
      }
      cells.add(DataGridCell<String>(
          columnName: sheetView.cols[colIx], value: value));
    }
    cells.add(DataGridCell<String>(
        columnName: '__rowDetail__', value: rowIx.toString()));
    DataGridRow dataGridRow = DataGridRow(cells: cells);

    return dataGridRow;
  }

  DataGridRow gridRow(Map row, int rowIx) {
    List<DataGridCell> cells = [];
    try {
      cells.add(DataGridCell<String>(
          columnName: '__leftRowMenu__', value: row['row_'].toString()));
    } catch (_) {
      cells.add(DataGridCell<String>(
          columnName: '__leftRowMenu__', value: rowIx.toString()));
    }

    for (var colIx = 0; colIx < sheetView.colsHeader.length; colIx++) {
      String value = '';
      try {
        value = row[sheetView.colsHeader[colIx]];
      } catch (_) {
        value = '?';
      }
      cells.add(DataGridCell<String>(
          columnName: sheetView.cols[colIx], value: value));
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
      style: const TextStyle(fontSize: 14, color: Colors.black),
      moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }

  Widget getCell(DataGridCell<dynamic> e, String searchWord, DataGridRow row) {
    if (e.columnName == '__rowDetail__') {
      return IconButton(
        icon: const Icon(Icons.chevron_right),
        onPressed: () => detailShow(sheetView, e.value),
      );
    }

    //return readmoreText(e.value.toString());
    return SubstringHighlight(
      text:
          e.value.toString(), // search result string from database or something
      term: searchWord, // user typed "et"
    );
  }

  Future detailShow(SheetView sheetView, String rowIx) async {
    sheetView.currentRowsIndex = int.tryParse(rowIx)!;
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailListViewPage(sheetView)),
    );
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      // sheetView.currentRowsIndex =
      //     int.tryParse(row.getCells().first.value.toString())!;
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: getCell(e, searchWord, row),
      );
    }).toList());
  }
}
