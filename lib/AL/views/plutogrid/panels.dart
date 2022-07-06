import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:resizable_widget/resizable_widget.dart';
import 'package:sheetviewer/AL/views/plutogrid/drawer.dart';
import 'package:sheetviewer/AL/views/plutogrid/paneldetail.dart';
import 'package:sheetviewer/AL/views/plutogrid/plutogridconfiguration.dart';
import 'package:sheetviewer/DL/isardb/sheetrows.dart';

import 'filters.dart';

ResizableWidget resizablePanels(
    List<PlutoColumn> plutoCols,
    final List<PlutoRow> gridrows,
    List<String> cols,
    ScrollController _controller,
    final screenWidth,
    Function setStateFunc,
    List<SheetRow?> sheetRows) {
  return ResizableWidget(
    children: [
      // required
      singleGrid(plutoCols, gridrows, cols, _controller, sheetRows),
      detailPanel_(screenWidth, _controller, setStateFunc)
    ],
    isHorizontalSeparator: false, // optional
    isDisabledSmartHide: false, // optional
    separatorColor: Colors.white12, // optional
    separatorSize: 4, // optional
    percentages: const [0.5, 0.5], // optional
    // onResized: (infoList) => // optional
    //     print(
    //         infoList.map((x) => '(${x.size}, ${x.percentage}%)').join(", "))
  );
}

SingleChildScrollView detailPanel_(
    final screenWidth, ScrollController _controller, Function setStateFunc) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: screenWidth / 2,
      ),
      child: detailPanel(_controller, setStateFunc),
    ),
  );
}

PlutoGrid singleGrid(
    List<PlutoColumn> plutoCols,
    final List<PlutoRow> gridrows,
    List<String> cols,
    ScrollController _controller,
    List<SheetRow?> sheetRows) {
  void onSelectHandle() {
    // print(gridAStateManager.currentCell!.value);
    // print(gridAStateManager.currentRow!.key);
    // print(gridAStateManager.currentColumn!.title);
    try {
      detailRowNo.value = gridAStateManager
          .currentCell!.row.cells.values.first.value
          .toString();
      getDetailList(detailRowNo.value, sheetRows);
      detailColumnField = gridAStateManager.currentColumn!.title;

      detailContent.value = gridAStateManager.currentCell!.value;
    } catch (_) {} //not init yet -- Unexpected null value.
  }

  return PlutoGrid(
    columns: plutoCols,
    rows: gridrows,
    mode: PlutoGridMode.select,

    // columnGroups: columnGroups,
    onLoaded: (PlutoGridOnLoadedEvent event) {
      gridAStateManager = event.stateManager;
      event.stateManager.setShowColumnFilter(true);

      gridAStateManager.eventManager!.listener((event) {
        if (event is PlutoGridChangeColumnFilterEvent) {}
      });
      filtersInit(cols);
      handleLoadFilter(gridAStateManager);

      gridAStateManager.addListener(onSelectHandle);

      if (_controller.hasClients) {
        gridAStateManager.scroll!.setBodyRowsVertical(_controller);
      }
    },
    onRowDoubleTap: (PlutoGridOnRowDoubleTapEvent event) async {
      //gridAStateManager.notifyListeners();
      handleSaveFilter(gridAStateManager);
      // print('----------------------------------');
      // int page = gridAStateManager.page;
      // print(page);
      //setState(() {});
      //gridAStateManager.setPage(page);

      //handleLoadFilter();
    },
    configuration: plutoGridConfiguration(),
    createFooter: (stateManager) {
      stateManager.setPageSize(100, notify: false); // default 40
      return PlutoPagination(stateManager);
    },
  );
}
