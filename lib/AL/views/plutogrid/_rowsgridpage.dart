import 'package:flutter/material.dart';

import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:sheetviewer/AL/views/plutogrid/panels.dart';
import 'package:sheetviewer/AL/views/plutogrid/statemanager.dart';

import 'package:sheetviewer/DL/isardb/sheetrows.dart';

import 'paneldetail.dart';
import 'drawer.dart';

/// The home page of the application which hosts the datagrid.
class RowsgridPage extends StatefulWidget {
  final List<PlutoColumn> plutoCols;
  final List<PlutoRow> gridrows;
  final List<SheetRow?> sheetRows;
  final List<String> cols;

  const RowsgridPage(this.plutoCols, this.gridrows, this.sheetRows, this.cols,
      {Key? key})
      : super(key: key);

  @override
  _RowsgridPageState createState() => _RowsgridPageState();
}

class _RowsgridPageState extends State<RowsgridPage> {
  final ScrollController _controller =
      ScrollController(initialScrollOffset: 50.0);

  @override
  void initState() {
    getDetailList(widget.sheetRows.first!.aRowNo, widget.sheetRows);
    super.initState();
    initStateManager(widget.plutoCols, widget.gridrows);
  }

  void setStateFunc() {
    setState(() {});
  }

  FocusNode gridFocusNode = FocusNode();
  LinkedScrollControllerGroup verticalScroll = LinkedScrollControllerGroup();

  LinkedScrollControllerGroup horizontalScroll = LinkedScrollControllerGroup();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: detailMode
            ? resizablePanels(widget.plutoCols, widget.gridrows, widget.cols,
                _controller, screenWidth, setStateFunc, widget.sheetRows)
            : singleGrid(widget.plutoCols, widget.gridrows, widget.cols,
                _controller, widget.sheetRows));
  }
}
