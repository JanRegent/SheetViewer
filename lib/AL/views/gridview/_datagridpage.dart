import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/alib/alib.dart';
import '/AL/views/gridview/rows.dart';
import '../../../BL/sheet/datasheet.dart';
import '/DL/loader/loader.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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

  @override
  void initState() {
    super.initState();
  }

  DataSheet dataSheet = DataSheet();

  Future<String> getData() async {
    dataSheet =
        DataSheet.fromJson(await getSheet(widget.fileId, widget.sheetName));
    dataSheet.sheetTitle = widget.sheetTitle;
    rowsDataSource = RowsDataSource(dataSheet, context);

    return rowsDataSource.dataSheet.rows.length.toString();
  }

  final DataGridController _controller = DataGridController();

  SfDataGrid sfDataGrid() {
    return SfDataGrid(
      source: rowsDataSource,
      columnWidthMode: ColumnWidthMode.fill,
      columns: colsHeader(dataSheet),
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
          actions: [
            al.linkIconSheetOnGCloud(widget.fileId),
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
