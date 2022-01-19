// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/sheet/datasheet.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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
  int rowsSelectedIndex = 0;
  Future<String> getData() async {
    endpointSheet = await getdatasheet(
        '1VfBoc8YX3AGF-pLXfTAZKMO4Ig-UnfcrItOyGHCYh9M', widget.endpointName);
    rowsDataSource =
        RowsDataSource(endpointSheet, context, '', widget.endpointName);
    return 'ok';
  }

  Column apiGrid() {
    return Column(
      children: [
        SfDataGrid(
          source: rowsDataSource,
          columnWidthMode: ColumnWidthMode.fill,
          selectionMode: SelectionMode.single,
          columns: colsHeader(endpointSheet, context),
          onSelectionChanged:
              (List<DataGridRow> selectedRows, List<DataGridRow> removedRows) {
            setState(() {
              rowsSelectedIndex =
                  rowsDataSource.rows.indexOf(selectedRows.first);
            });
          },
        ),
        Text(endpointSheet.rows[rowsSelectedIndex]['rowsCount'].toString())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Endpoint: ${widget.endpointName}'),
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
