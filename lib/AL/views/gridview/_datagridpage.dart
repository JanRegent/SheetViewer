// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/views/gridview/listsearch.dart';
import 'package:sheetviewer/DL/models/sheetview.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '/AL/views/gridview/rows.dart';

import 'cols.dart';

/// The home page of the application which hosts the datagrid.
class DatagridPage extends StatefulWidget {
  final SheetView sheetView;
  final String fileTitle;
  const DatagridPage(this.sheetView, this.fileTitle, {Key? key})
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

  String searchWord = ''; // 'ship';
  Future<String> getData() async {
    rowsDataSource = RowsDataSource(widget.sheetView, context, searchWord);
    return rowsDataSource.sheetView.rows.length.toString();
  }

  void setStateFunc() {
    setState(() {});
  }

  IconButton jsonViewer() {
    return IconButton(
        onPressed: () async {
          //bl.dataSheet4debug = widget.sheetView;
          // await Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) =>
          //             JsonViewerPage(bl.dataSheet4debug.rawDataSheet)));
        },
        icon: const Icon(Icons.view_agenda));
  }

  final DataGridController _controller = DataGridController();

  SfDataGrid sfDataGrid() {
    return SfDataGrid(
      source: rowsDataSource,
      columnWidthMode: ColumnWidthMode.fill,
      columns: colsHeader(widget.sheetView, context, setStateFunc),
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
              ? Text(widget.fileTitle)
              : Text(widget.fileTitle + ' [$searchWord]'),
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
                  // await Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             EndpointsTabPage(widget.dataSheet)));
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
