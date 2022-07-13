import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/AL/views/plutogrid/cols.dart';
import 'package:sheetviewer/AL/views/plutogrid/paneldetail.dart';
import 'package:sheetviewer/AL/views/plutogrid/panels.dart';

import 'package:sheetviewer/AL/views/plutogrid/rows.dart';
import 'package:sheetviewer/AL/views/plutogrid/statemanager.dart';
import 'package:sheetviewer/DL/isardb/sheetrows.dart';

import 'drawer.dart';

class AsyncGrid extends StatefulWidget {
  final List<String> cols;
  final List<SheetRow?> sheetRows;

  const AsyncGrid(this.cols, this.sheetRows, {Key? key}) : super(key: key);

  @override
  _AsyncGridState createState() => _AsyncGridState();
}

class _AsyncGridState extends State<AsyncGrid> {
  final List<PlutoColumn> plutoCols = [];

  List<PlutoRow> gridRows = [];
  final ScrollController _controller =
      ScrollController(initialScrollOffset: 50.0);

  @override
  void initState() {
    /// Columns must be provided at the beginning of a row synchronously.
    plutoCols.addAll(colsMap(widget.cols));
    initStateManager(plutoCols, gridRows);
    super.initState();
  }

  Future<String> getGridRows() async {
    gridRows = await gridRowsMap(widget.sheetRows, widget.cols);
    getDetailList(widget.sheetRows.first!.aRowNo, widget.sheetRows);

    return 'OK';
  }

  void setStateFunc() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    gridAStateManager.setShowLoading(true);

    return Scaffold(
        body: FutureBuilder(
      future: getGridRows(), // async work
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            gridAStateManager.setShowLoading(true);
            return Column(
              children: const [
                Text('Loading \n interest '),
                Text(' '),
                CircularProgressIndicator()
              ],
            );

          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              gridAStateManager.setShowLoading(false);
              return detailMode
                  ? resizablePanels(plutoCols, gridRows, widget.cols,
                      _controller, screenWidth, setStateFunc, widget.sheetRows)
                  : singleGrid(plutoCols, gridRows, widget.cols, _controller,
                      widget.sheetRows);
              //RowsgridPage(gridCols, gridrows, sheetRows, cols);
            }
        }
      },
    ));
  }
}
