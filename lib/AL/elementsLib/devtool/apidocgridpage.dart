// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbycheckoxes.dart';

import 'package:sheetviewer/DL/models/sheetconfig.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'apidoccols.dart';
import 'apidocrows.dart';

class ApidocGridPage extends StatefulWidget {
  final String endpointName;
  final SheetConfig sheetConfig;
  static String id = 'datagrid';
  ApidocGridPage(this.endpointName, this.sheetConfig, {Key? key})
      : super(key: key);

  @override
  _ApidocGridPageState createState() => _ApidocGridPageState();
}

class _ApidocGridPageState extends State<ApidocGridPage> {
  late RowsDataSource rowsDataSource;

  @override
  void initState() {
    super.initState();
  }

  List<String> columnsSelected = [];
  ValueNotifier<int> rowsSelectedIndex = ValueNotifier(0);

  Future<String> getData() async {
    columnsSelected = columnsGetUsed(widget.sheetConfig, widget.endpointName);
    rowsDataSource =
        RowsDataSource(widget.sheetConfig, context, '', widget.endpointName);
    return 'ok';
  }

  Column apiGrid() {
    return Column(
      children: [
        SfDataGrid(
          source: rowsDataSource,
          selectionMode: SelectionMode.single,
          columns: colsHeader(widget.sheetConfig, context, widget.endpointName),
          onSelectionChanged:
              (List<DataGridRow> selectedRows, List<DataGridRow> removedRows) {
            rowsSelectedIndex.value =
                rowsDataSource.rows.indexOf(selectedRows.first);
            globalsBox.write('rowsSelectedIndex', rowsSelectedIndex.value);
          },
          allowSorting: true,
          allowTriStateSorting: true,
          allowColumnsResizing: false,
          columnWidthMode: ColumnWidthMode.auto,
          columnResizeMode: ColumnResizeMode.onResizeEnd,
          onColumnResizeUpdate: (ColumnResizeUpdateDetails details) {
            setState(() {
              columnWidths[details.column.columnName] = details.width;
            });
            return true;
          },
        ),
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
                    context, columnsSelected, 'Select columns');
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
