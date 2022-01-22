// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:sheetviewer/AL/alib/alib.dart';
import 'package:sheetviewer/AL/views/gridview/_datagridpage.dart';
import 'package:sheetviewer/BL/sheet/datasheet.dart';
import 'package:sheetviewer/Components/selectList/selectlistbycheckoxes.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../BL/bl.dart';
import '../loader/loader.dart';
import 'apidoccols.dart';
import 'apidocrows.dart';

class ApidocGridPage extends StatefulWidget {
  final String endpointName;
  static String id = 'datagrid';
  ApidocGridPage(this.endpointName, {Key? key}) : super(key: key);

  @override
  _ApidocGridPageState createState() => _ApidocGridPageState();
}

class _ApidocGridPageState extends State<ApidocGridPage> {
  late RowsDataSource rowsDataSource;

  @override
  void initState() {
    super.initState();
  }

  late DataSheet endpointSheet;
  List<String> columnsSelected = [];
  ValueNotifier<int> rowsSelectedIndex = ValueNotifier(0);

  Future<String> getData() async {
    endpointSheet = await getdatasheet(
        '1VfBoc8YX3AGF-pLXfTAZKMO4Ig-UnfcrItOyGHCYh9M', widget.endpointName);
    if (columnsSelected.isNotEmpty) {
      endpointSheet.config.columnsSelected = columnsSelected;
    }

    rowsDataSource =
        RowsDataSource(endpointSheet, context, '', widget.endpointName);
    return 'ok';
  }

  String getQuerystring() {
    String queryString = '?action=' + widget.endpointName + '&';
    for (var i = 0; i < endpointSheet.cols.length; i++) {
      if (endpointSheet.cols[i].startsWith('__')) continue;
      queryString += endpointSheet.cols[i] +
          '=' +
          endpointSheet.rows[rowsSelectedIndex.value][endpointSheet.cols[i]]
              .toString() +
          '&';
    }
    queryString = queryString.substring(0, queryString.length - 1);
    backendUrl = bl.blGlobal.contentServiceUrl + queryString;
    return queryString;
  }

  ListTile queryStringTile() {
    return ListTile(
        leading: const Text('querystring'),
        title: ValueListenableBuilder<int>(
          valueListenable: rowsSelectedIndex,
          builder: (context, value, child) => Text(
            getQuerystring(),
            style: const TextStyle(fontSize: 20.0, color: Colors.black),
          ),
        ),
        trailing: IconButton(
            icon: const Icon(Icons.copy),
            color: Colors.black,
            tooltip: 'Copy columns toi clipboard',
            onPressed: () async {
              FlutterClipboard.copy(getQuerystring()).then((value) {});
            }));
  }

  String backendUrl = '';
  ListTile actionsTile() {
    return ListTile(
        leading: const Text('actions'),
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.web),
              tooltip: 'In browser',
              onPressed: () async {
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
            al.jsonViewer(context, endpointSheet.config),
          ],
        ));
  }

  Column apiGrid() {
    return Column(
      children: [
        SfDataGrid(
          source: rowsDataSource,
          selectionMode: SelectionMode.single,
          columns: colsHeader(endpointSheet, context),
          onSelectionChanged:
              (List<DataGridRow> selectedRows, List<DataGridRow> removedRows) {
            rowsSelectedIndex.value =
                rowsDataSource.rows.indexOf(selectedRows.first);
            getQuerystring();
          },
          allowSorting: true,
          allowTriStateSorting: true,
          allowColumnsResizing: false,
          columnWidthMode: ColumnWidthMode.auto,
          // columnResizeMode: ColumnResizeMode.onResizeEnd,
          // onColumnResizeUpdate: (ColumnResizeUpdateDetails details) {
          //   setState(() {
          //     columnWidths[details.column.columnName] = details.width;
          //   });
          //   return true;
          // },
        ),
        queryStringTile(),
        actionsTile()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Endpoint: ${widget.endpointName}'),
        actions: [
          IconButton(
              onPressed: () async {
                List<String> result = await selectListByCheckoxes(
                    context, endpointSheet.cols, 'Select columns');
                if (result.isEmpty) return;

                setState(() {
                  columnsSelected = result;
                });
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder<String>(
        future: getData(), // async work
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Column(
                children: const [
                  Text('Loading....'),
                  CircularProgressIndicator()
                ],
              );

            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return apiGrid();
              }
          }
        },
      ),
    );
  }
}
