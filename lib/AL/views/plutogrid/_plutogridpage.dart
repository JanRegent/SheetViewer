import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/DL/isardb/sheetview.dart';

import 'rows.dart';

/// The home page of the application which hosts the datagrid.
class PlutogridPage extends StatefulWidget {
  final String fileTitle;
  final List<PlutoColumn> cols;
  final List<PlutoRow> gridrows;
  final SheetView sheetView;
  const PlutogridPage(this.fileTitle, this.cols, this.gridrows, this.sheetView,
      {Key? key})
      : super(key: key);

  @override
  _PlutogridPageState createState() => _PlutogridPageState();
}

class _PlutogridPageState extends State<PlutogridPage> {
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

  PlutoGrid plutoGrid() {
    return PlutoGrid(
      columns: widget.cols,
      rows: widget.gridrows,
      // columnGroups: columnGroups,
      onLoaded: (PlutoGridOnLoadedEvent event) {
        stateManager = event.stateManager;
        event.stateManager.setShowColumnFilter(true);
      },
      // onChanged: (PlutoGridOnChangedEvent event) {},
      // onSelected: (PlutoGridOnSelectedEvent event) {},
      onRowDoubleTap: (PlutoGridOnRowDoubleTapEvent event) async {
        if (event.cell?.column.field == '__rowDetail__') {
          widget.sheetView.currentRow_ = event.cell?.row.cells['row_']!.value;
          await detailShow(widget.sheetView, context);
        }
      },
      configuration: PlutoGridConfiguration(
        enableColumnBorder: true,
        columnFilterConfig: PlutoGridColumnFilterConfig(
          filters: const [
            ...FilterHelper.defaultFilters,
            // custom filter
          ],
          resolveDefaultColumnFilter: (column, resolver) {
            if (column.field == 'text') {
              return resolver<PlutoFilterTypeContains>() as PlutoFilterType;
            }

            return resolver<PlutoFilterTypeContains>() as PlutoFilterType;
          },
        ),
      ),
      createFooter: (stateManager) {
        stateManager.setPageSize(100, notify: false); // default 40
        return PlutoPagination(stateManager);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: plutoGrid(),
    );
  }
}
