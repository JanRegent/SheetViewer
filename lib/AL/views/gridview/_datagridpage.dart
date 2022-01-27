// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/views/gridview/listsearch.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/uti/viewers/json_viewer.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../BL/sheet/datasheet.dart';
import '/AL/views/gridview/rows.dart';
import '/DL/loader/loader.dart';
import 'cols.dart';

/// The home page of the application which hosts the datagrid.
class DatagridPage extends StatefulWidget {
  final String fileId;
  final String sheetName;
  final String sheetTitle;
  final String queryString;
  const DatagridPage(
      this.fileId, this.sheetName, this.sheetTitle, this.queryString,
      {Key? key})
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
    if (widget.queryString != null) {
      dataSheet = await getEndpoint(widget.queryString);
    } else {
      dataSheet = await getdatasheet(widget.fileId, widget.sheetName);
    }
    dataSheet.sheetTitle = widget.sheetTitle;
    rowsDataSource = RowsDataSource(dataSheet, context, searchWord);
    return rowsDataSource.dataSheet.rows.length.toString();
  }

  IconButton jsonViewer() {
    return IconButton(
        onPressed: () async {
          bl.dataSheet4debug = dataSheet;
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      JsonViewerPage(bl.dataSheet4debug.rawDataSheet)));
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
          title: searchWord.isEmpty
              ? Text(widget.sheetTitle)
              : Text(widget.sheetTitle + ' [$searchWord]'),
          actions: [
            searchWord.isNotEmpty
                ? IconButton(
                    onPressed: () async {
                      searchWord = '';
                      setState(() {});
                    },
                    icon: const Icon(Icons.clear))
                : const Text(' '),
            // Navigate to the Search Screen
            IconButton(
                onPressed: () async {
                  searchWord = '';
                  searchWord = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListSearch()));

                  setState(() {});
                },
                icon: const Icon(Icons.search)),
            jsonViewer()
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
                  return sfDataGrid();
                }
            }
          },
        ));
  }
}
