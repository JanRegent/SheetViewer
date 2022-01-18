import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../BL/sheet/datasheet.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../AL/views/gridview/_datagridpage.dart';
import '../../BL/bl.dart';

class RowsDataSource extends DataGridSource {
  final DataSheet dataSheet;
  final BuildContext context;
  final String endpointName;
  final String searchWord;

  RowsDataSource(
      this.dataSheet, this.context, this.searchWord, this.endpointName) {
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
        if ('curl' == dataSheet.config.columnsSelected[colIx]) {
          value = bl.blGlobal.contentServiceUrl +
              '?action=$endpointName' +
              '&fileId=${dataSheet.rows[rowIx]['fileId']}&sheetName=${dataSheet.rows[rowIx]['sheetName']}' +
              '&rowsCount=${dataSheet.rows[rowIx]['rowsCount'].toString()}';
        } else {
          value = dataSheet.rows[rowIx][dataSheet.config.columnsSelected[colIx]]
              .toString();
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
      return Row(
        children: [
          IconButton(
            icon: const Icon(Icons.web),
            onPressed: () async {
              await canLaunch(e.value)
                  ? await launch(e.value)
                  : throw 'Could not launch: ${e.value}';
            },
          ),
          IconButton(
            icon: const Icon(Icons.table_chart),
            onPressed: () async {
              String fileTitle = e.value
                  .toString()
                  .substring(bl.blGlobal.contentServiceUrl.length);
              String fileId = fileTitle.substring(fileTitle.indexOf('fileId'));
              fileId = fileId.substring(7, fileId.indexOf('sheetName') - 1);

              String sheetName =
                  fileTitle.substring(fileTitle.indexOf('sheetName'));
              sheetName = sheetName.substring(10);
              sheetName = sheetName.substring(0, sheetName.indexOf('&'));

              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DatagridPage(fileId, sheetName, fileTitle),
                  ));
            },
          )
        ],
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
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(8.0),
        child: getCell(e, rowIx),
      );
    }).toList());
  }
}
