import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:sheetviewer/uti/viewers/json_viewer.dart';

import '../../../BL/sheet/datasheet.dart';
import '/AL/views/gridview/rows.dart';
import '/DL/loader/loader.dart';
import 'cols.dart';

/// The home page of the application which hosts the datagrid.
class DatagridPage extends StatefulWidget {
  final String fileId;
  final String sheetName;
  final String sheetTitle;
  const DatagridPage(this.fileId, this.sheetName, this.sheetTitle, {Key? key})
      : super(key: key);

  @override
  _DatagridPageState createState() => _DatagridPageState();
}

class _DatagridPageState extends State<DatagridPage> {
  late RowsDataSource rowsDataSource;
  String fileurlId = '';
  @override
  void initState() {
    super.initState();
  }

  DataSheet dataSheet = DataSheet();
  String searchWord = ''; // 'ship';
  Future<String> getData() async {
    dataSheet = await getdatasheet(widget.fileId, widget.sheetName);
    dataSheet.sheetTitle = widget.sheetTitle;
    rowsDataSource = RowsDataSource(dataSheet, context, searchWord);

    return rowsDataSource.dataSheet.rows.length.toString();
  }

  IconButton jsonViewer() {
    return IconButton(
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      JsonViewerPage(dataSheet.rawDataSheet)));
        },
        icon: const Icon(Icons.view_agenda));
  }

  final DataGridController _controller = DataGridController();

  SfDataGrid sfDataGrid() {
    return SfDataGrid(
      source: rowsDataSource,
      columnWidthMode: ColumnWidthMode.fill,
      columns: colsHeader(dataSheet, context),
      onQueryRowHeight: (RowHeightDetails details) {
        return details.getIntrinsicRowHeight(details.rowIndex);
      },
      controller: _controller,
      selectionMode: SelectionMode.single,
      showCheckboxColumn: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.sheetTitle),
          actions: [jsonViewer()],
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
                  return sfDataGrid();
                }
            }
          },
        ));
  }
}
