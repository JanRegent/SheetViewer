// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elements/getrows/bl_getrows.dart';
import 'package:sheetviewer/AL/elementsLib/devtool/_endpointstabpage.dart';
import 'package:sheetviewer/AL/pages/views/gridview/listsearch.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

import 'package:sheetviewer/uti/viewers/json_viewer.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../BL/datasheet/datasheet.dart';
import '/AL/pages/views/gridview/rows.dart';

import 'cols.dart';

/// The home page of the application which hosts the datagrid.
class DatagridPage extends StatefulWidget {
  final String fileId;
  final String sheetName;
  final String sheetTitle;
  final Map queryMap;
  const DatagridPage(
      this.fileId, this.sheetName, this.sheetTitle, this.queryMap,
      {Key? key})
      : super(key: key);

  @override
  _DatagridPageState createState() => _DatagridPageState();
}

class _DatagridPageState extends State<DatagridPage> {
  late RowsDataSource rowsDataSource;
  String fileurlId = '';
  String headerColsKey = '';
  @override
  void initState() {
    super.initState();

    headerColsKey =
        'sheetName=${widget.sheetName}&vars=headerCols&fileId=${widget.fileId}';
  }

  DataSheet dataSheet = DataSheet();
  String searchWord = ''; // 'ship';
  Future<String> getData() async {
    dataSheet = await getRows(widget.fileId, widget.sheetName, widget.queryMap);

    dataSheet.sheetTitle = widget.sheetTitle;

    List<String> headerColsLocal = await interestStore.readList(headerColsKey);
    if (headerColsLocal.isNotEmpty) dataSheet.headerCols = headerColsLocal;

    rowsDataSource = RowsDataSource(dataSheet, context, searchWord);
    return rowsDataSource.dataSheet.rows.length.toString();
  }

  void setStateFunc() {
    setState(() {});
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
      columns: colsHeader(dataSheet, context, setStateFunc, headerColsKey),
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
            IconButton(
                onPressed: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EndpointsTabPage(dataSheet)));
                },
                icon: const Icon(Icons.developer_board))
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
