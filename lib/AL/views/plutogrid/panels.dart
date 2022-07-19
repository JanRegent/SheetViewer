import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:resizable_widget/resizable_widget.dart';
import 'package:sheetviewer/AL/views/plutogrid/drawer.dart';
import 'package:sheetviewer/AL/views/plutogrid/paneldetail.dart';
import 'package:sheetviewer/BL/isardb/sheetrows.dart';

import 'filters.dart';

ResizableWidget resizablePanels(
    List<PlutoColumn> plutoCols,
    final List<PlutoRow> gridrows,
    ScrollController _controller,
    final screenWidth,
    Function setStateFunc,
    List<SheetRow?> sheetRows) {
  return ResizableWidget(
    children: [
      // required
      singleGrid(plutoCols, gridrows, _controller, sheetRows),
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

PlutoPagination plutoPagination = PlutoPagination(viewHelper.gridAStateManager);
int currentPage = 1;
PlutoGrid singleGrid(List<PlutoColumn> plutoCols, final List<PlutoRow> gridrows,
    ScrollController _controller, List<SheetRow?> sheetRows) {
  void onSelectHandle() {
    // print(gridAStateManager.currentCell!.value);
    // print(gridAStateManager.currentRow!.key);
    // print(gridAStateManager.currentColumn!.title);
    currentPage = plutoPagination.stateManager.page;
    //rint(currentPage);
    try {
      detailRowNo.value = viewHelper
          .gridAStateManager.currentCell!.row.cells.values.first.value;
      getDetailList(detailRowNo.value, sheetRows);
      detailColumnField = viewHelper.gridAStateManager.currentColumn!.title;

      detailContent.value = viewHelper.gridAStateManager.currentCell!.value;
    } catch (_) {} //not init yet -- Unexpected null value.
  }

  return PlutoGrid(
    columns: plutoCols,
    rows: gridrows,
    mode: PlutoGridMode.select,

    // columnGroups: columnGroups,
    onLoaded: (PlutoGridOnLoadedEvent event) {
      viewHelper.gridAStateManager = event.stateManager;
      viewHelper.gridAStateManager.setShowColumnFilter(true);

      viewHelper.gridAStateManager.eventManager!.listener((event) {
        if (event is PlutoGridChangeColumnFilterEvent) {}
      });
      filtersInit(viewHelper.viewConfig.colsFilter);
      handleLoadFilter(viewHelper.gridAStateManager);

      viewHelper.gridAStateManager.addListener(onSelectHandle);
      //plutoPagination.stateManager.setPage(2); //if pages > 1
      if (_controller.hasClients) {
        viewHelper.gridAStateManager.scroll!.setBodyRowsVertical(_controller);
      }
    },
    onChanged: (PlutoGridOnChangedEvent event) {
      //rint(event);
    },
    onRowDoubleTap: (PlutoGridOnRowDoubleTapEvent event) async {
      //gridAStateManager.notifyListeners();
      // print('----------------------------------');
      // int page = gridAStateManager.page;
      // print(page);
      //setState(() {});
      //gridAStateManager.setPage(page);

      //handleLoadFilter();
    },
    //configuration: plutoGridConfiguration(),
    createFooter: (stateManager) {
      stateManager.setPageSize(100, notify: false); // default 40
      return PlutoPagination(stateManager);
    },
  );
}
