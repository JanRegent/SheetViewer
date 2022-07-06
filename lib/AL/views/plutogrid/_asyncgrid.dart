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
import 'filters.dart';

class AsyncGrid extends StatefulWidget {
  final List<String> cols;
  final List<SheetRow?> sheetRows;

  static const routeName = 'feature/add-rows-asynchronously';

  const AsyncGrid(this.cols, this.sheetRows, {Key? key}) : super(key: key);

  @override
  _AsyncGridState createState() => _AsyncGridState();
}

class _AsyncGridState extends State<AsyncGrid> {
  final List<PlutoColumn> plutoCols = [];

  List<PlutoRow> gridrows = [];
  final ScrollController _controller =
      ScrollController(initialScrollOffset: 50.0);

  @override
  void initState() {
    getDetailList(widget.sheetRows.first!.aRowNo, widget.sheetRows);
    super.initState();

    /// Columns must be provided at the beginning of a row synchronously.
    plutoCols.addAll(colsMap(widget.cols));

    fetchRows().then((fetchedRows) {
      /// When there are many rows and the UI freezes when the grid is loaded
      /// Initialize the rows asynchronously through the initializeRowsAsync method
      /// Add rows to stateManager.refRows.
      /// And disable the loading screen.
      PlutoGridStateManager.initializeRowsAsync(
        plutoCols,
        fetchedRows,
      ).then((value) {
        gridAStateManager.refRows.addAll(FilteredList(initialList: value));

        /// In this example,
        /// the loading screen is activated in the onLoaded callback when the grid is created.
        /// If the loading screen is not activated
        /// You must update the grid state by calling the stateManager.notifyListeners() method.
        /// Because calling setShowLoading updates the grid state
        /// No need to call stateManager.notifyListeners.
        gridAStateManager.setShowLoading(false);
      });
    });
  }

  /// This method creates rows asynchronously for the sake of example.
  /// In actual use, you are requesting server-side data with Http and
  /// You will need to create and return PlutoRow and PlutoCell.
  /// It's up to you.
  /// This is just an example.
  Future<List<PlutoRow>> fetchRows() {
    final Completer<List<PlutoRow>> completer = Completer();

    int count = 0;

    const max = 100;

    const totalRows = 77;

    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if (count == max) {
        return;
      }

      ++count;

      Future(() async {
        gridrows = await gridRowsMap(widget.sheetRows, widget.cols);

        return gridrows;
        // DummyData.rowsByColumns(length: chunkSize, columns: columns);
      }).then((value) {
        try {
          if (gridrows.length > totalRows) {
            completer.complete(gridrows);
            timer.cancel();
          }
        } catch (_) {} //Error: Bad state: Future already completed
      });
    });
    initStateManager(plutoCols, gridrows);
    filtersSetState(gridAStateManager, widget.cols);
    return completer.future;
  }

  void setStateFunc() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: detailMode
            ? resizablePanels(plutoCols, gridrows, widget.cols, _controller,
                screenWidth, setStateFunc, widget.sheetRows)
            : singleGrid(plutoCols, gridrows, widget.cols, _controller,
                widget.sheetRows));

    // PlutoGrid(
    //   columns: columns,
    //   rows: rows,
    //   onChanged: (PlutoGridOnChangedEvent event) {
    //     //rint(event);
    //   },
    //   onLoaded: (PlutoGridOnLoadedEvent event) {
    //     gridAStateManager = event.stateManager;

    //     /// When the grid is finished loading, enable loading.
    //     gridAStateManager.setShowLoading(true);
    //   },
    //   configuration: plutoGridConfiguration(),
    // );
  }
}