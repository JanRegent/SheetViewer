import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sheetviewer/AL/views/gridview/_datagridpage.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';
import 'package:sheetviewer/BL/sheet/sheet_config.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:url_launcher/url_launcher.dart';

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
    List<String> columns = columnsGetUsed(sheetConfig, endpointName);
    List<String> configRows = configRowsGet(sheetConfig, endpointName);

    List<DataGridRow> gridrows = [];
    for (var rowIx = 0; rowIx < configRows.length; rowIx++) {
      gridrows.add(gridRow(columns, configRows, rowIx));
    }
    return gridrows;
  }

  List<String> configRowsGet(SheetConfig sheetConfig, String endpointName) {
    List<String> configRows = [];
    if (endpointName.contains('getRows')) configRows = sheetConfig.getRows;
    if (endpointName.contains('select1')) configRows = sheetConfig.selects1;
    return configRows;
  }

  DataGridRow gridRow(List<String> columns, List<String> values, int rowIx) {
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

    cells.add(DataGridCell<Widget>(
        columnName: '__buttons__', value: actionsTile(rowIx, sheetConfig)));

    cells.add(DataGridCell<String>(
        columnName: '__rowDetail__', value: rowIx.toString()));

    DataGridRow dataGridRow = DataGridRow(
      cells: cells,
    );

    return dataGridRow;
  }

  String getQuerystring(int rowIx, SheetConfig sheetConfig) {
    List<String> columns = columnsGetUsed(sheetConfig, endpointName);
    List<String> configRows = configRowsGet(sheetConfig, endpointName);
    Map configRow = jsonDecode(configRows[rowIx]);

    String queryString = '?';

    for (var i = 0; i < columns.length; i++) {
      if (configRow[columns[i]] == null) continue;
      if (columns[i].startsWith('__')) continue;
      queryString += columns[i] + '=' + configRow[columns[i]].toString() + '&';
    }
    queryString = queryString.substring(0, queryString.length - 1);
    queryString = queryString.replaceFirst('endpoint', 'action');
    queryString +=
        '&fileId=' + sheetConfig.fileId + '&sheetName=' + sheetConfig.sheetName;
    backendUrl = bl.blGlobal.contentServiceUrl + queryString;
    return queryString;
  }

  String backendUrl = '';
  ListTile actionsTile(int rowIx, SheetConfig sheetConfig) {
    return ListTile(
        title: Row(
      children: [
        IconButton(
          icon: const Icon(Icons.web),
          tooltip: 'In browser',
          onPressed: () async {
            box.write(
                'bl.global.querystring', getQuerystring(rowIx, sheetConfig));
            await canLaunch(backendUrl)
                ? await launch(backendUrl)
                : throw 'Could not launch: $backendUrl';
          },
        ),
        IconButton(
          icon: const Icon(Icons.table_chart),
          tooltip: 'In SheetsViewer',
          onPressed: () async {
            String fileTitle = backendUrl
                .toString()
                .substring(bl.blGlobal.contentServiceUrl.length);

            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DatagridPage('', '', fileTitle, backendUrl),
                ));
          },
        ),

        //al.jsonViewer(context, endpointSheet.config),
      ],
    ));
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

  Widget getCell(DataGridCell<dynamic> e, int rowIx, SheetConfig sheetConfig) {
    if (e.columnName == '__rowDetail__') {
      return IconButton(
        icon: const Icon(Icons.chevron_right),
        onPressed: () => detailShow(rowIx),
      );
    }
    if (e.columnName == '__buttons__') {
      return actionsTile(rowIx, sheetConfig);
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
        child: getCell(e, rowIx, sheetConfig),
      );
    }).toList());
  }
}
