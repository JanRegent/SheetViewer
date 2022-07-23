import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/AL/views/plutogrid/paneldetail.dart';
import 'package:sheetviewer/AL/views/plutogrid/panels.dart';

import 'package:sheetviewer/AL/views/plutogrid/rows.dart';
import 'package:sheetviewer/AL/views/plutogrid/statemanager.dart';
import 'package:sheetviewer/BL/isardb/sheetrows.dart';

import 'drawergrid.dart';

class GridPage extends StatefulWidget {
  final List<SheetRow?> sheetRows;

  const GridPage(this.sheetRows, {Key? key}) : super(key: key);

  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  List<PlutoRow> gridRows = [];
  final ScrollController _controller =
      ScrollController(initialScrollOffset: 50.0);

  @override
  void initState() {
    initStateManager(viewHelper.plutoCols, gridRows);
    super.initState();
  }

  Future<String> getGridRows() async {
    gridRows.clear();
    gridRows =
        await gridRowsMap(widget.sheetRows, viewHelper.viewConfig.colsHeader);
    getDetailList(widget.sheetRows);

    return 'OK';
  }

  void setStateFunc() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    viewHelper.gridAStateManager.setShowLoading(true);
    return Scaffold(
        body: FutureBuilder(
      future: getGridRows(), // async work
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            viewHelper.gridAStateManager.setShowLoading(true);
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
              viewHelper.gridAStateManager.setShowLoading(false);
              return detailMode
                  ? resizablePanels(viewHelper.plutoCols, gridRows, _controller,
                      screenWidth, setStateFunc, widget.sheetRows)
                  : singleGrid(viewHelper.plutoCols, gridRows, _controller,
                      widget.sheetRows);
            }
        }
      },
    ));
  }
}
