import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/AL/views/plutogrid/cols.dart';
import 'package:sheetviewer/AL/views/plutogrid/rows.dart';
import 'package:sheetviewer/DL/isardb/sheetrows.dart';

class AsyncGrid extends StatefulWidget {
  final List<String> cols;
  final List<SheetRow?> sheetRows;

  static const routeName = 'feature/add-rows-asynchronously';

  const AsyncGrid(this.cols, this.sheetRows, {Key? key}) : super(key: key);

  @override
  _AsyncGridState createState() => _AsyncGridState();
}

class _AsyncGridState extends State<AsyncGrid> {
  final List<PlutoColumn> columns = [];

  final List<PlutoRow> rows = [];

  late PlutoGridStateManager stateManager;

  @override
  void initState() {
    super.initState();

    /// Columns must be provided at the beginning of a row synchronously.
    columns.addAll(colsMap(widget.cols));

    fetchRows().then((fetchedRows) {
      /// When there are many rows and the UI freezes when the grid is loaded
      /// Initialize the rows asynchronously through the initializeRowsAsync method
      /// Add rows to stateManager.refRows.
      /// And disable the loading screen.
      PlutoGridStateManager.initializeRowsAsync(
        columns,
        fetchedRows,
      ).then((value) {
        stateManager.refRows.addAll(FilteredList(initialList: value));

        /// In this example,
        /// the loading screen is activated in the onLoaded callback when the grid is created.
        /// If the loading screen is not activated
        /// You must update the grid state by calling the stateManager.notifyListeners() method.
        /// Because calling setShowLoading updates the grid state
        /// No need to call stateManager.notifyListeners.
        stateManager.setShowLoading(false);
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

    List<PlutoRow> _rows = [];

    int count = 0;

    const max = 100;

    const totalRows = 77;

    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if (count == max) {
        return;
      }

      ++count;

      Future(() async {
        _rows = await gridRowsMap(widget.sheetRows, widget.cols);
        return gridRowsMap(widget.sheetRows, widget.cols);
        // DummyData.rowsByColumns(length: chunkSize, columns: columns);
      }).then((value) {
        _rows.addAll(value);
        try {
          if (_rows.length > totalRows) {
            completer.complete(_rows);
            timer.cancel();
          }
        } catch (_) {} //Error: Bad state: Future already completed
      });
    });

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
      columns: columns,
      rows: rows,
      onChanged: (PlutoGridOnChangedEvent event) {
        //rint(event);
      },
      onLoaded: (PlutoGridOnLoadedEvent event) {
        stateManager = event.stateManager;

        /// When the grid is finished loading, enable loading.
        stateManager.setShowLoading(true);
      },
      configuration: const PlutoGridConfiguration(),
    );
  }
}
