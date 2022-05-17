// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:sheetviewer/DL/isardb/sheetview.dart';

/// The home page of the application which hosts the datagrid.
class PlutogridPage extends StatefulWidget {
  final SheetView sheetView;
  final String fileTitle;
  final List<PlutoColumn> cols;
  final List<PlutoRow> gridrows;
  const PlutogridPage(this.sheetView, this.fileTitle, this.cols, this.gridrows,
      {Key? key})
      : super(key: key);

  @override
  _PlutogridPageState createState() => _PlutogridPageState();
}

class _PlutogridPageState extends State<PlutogridPage> {
  String fileurlId = '';
  @override
  void initState() {
    super.initState();
    initStateManager();
  }

  late PlutoGridStateManager stateManager;
  FocusNode gridFocusNode = FocusNode();
  LinkedScrollControllerGroup verticalScroll = LinkedScrollControllerGroup();

  LinkedScrollControllerGroup horizontalScroll = LinkedScrollControllerGroup();

  void initStateManager() {
    stateManager = PlutoGridStateManager(
      columns: widget.cols,
      rows: widget.gridrows,
      gridFocusNode: gridFocusNode,
      scroll: PlutoGridScrollController(
        vertical: verticalScroll,
        horizontal: horizontalScroll,
      ),
      // mode: widget.mode,
      // onChangedEventCallback: widget.onChanged,
      // onSelectedEventCallback: widget.onSelected,
      // createHeader: widget.createHeader,
      // createFooter: widget.createFooter,
      // configuration: widget.configuration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PlutoGrid(
      columns: widget.cols,
      rows: widget.gridrows,
      // columnGroups: columnGroups,
      onLoaded: (PlutoGridOnLoadedEvent event) {
        stateManager = event.stateManager;
      },
      onChanged: (PlutoGridOnChangedEvent event) {},
      onSelected: (PlutoGridOnSelectedEvent event) {},
      onRowDoubleTap: (PlutoGridOnRowDoubleTapEvent event) {
        if (kDebugMode) {
          print(event.cell?.column.field);
          print(event.cell?.row.cells['row_']!.value);
        }
      },
      configuration: const PlutoGridConfiguration(
        enableColumnBorder: true,
      ),
    ));
  }
}
