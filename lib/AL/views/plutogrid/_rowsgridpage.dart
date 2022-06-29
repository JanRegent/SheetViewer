import 'dart:math';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:sheetviewer/DL/isardb/sheetrows.dart';

String currentRow_ = '2';

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
  @override
  void initState() {
    super.initState();
    initStateManager();
  }

  late PlutoGridStateManager gridAStateManager;
  final List<PlutoColumn> gridBColumns = [];
  final List<PlutoRow> gridBRows = [];

  FocusNode gridFocusNode = FocusNode();
  LinkedScrollControllerGroup verticalScroll = LinkedScrollControllerGroup();

  LinkedScrollControllerGroup horizontalScroll = LinkedScrollControllerGroup();

  void initStateManager() {
    gridAStateManager = PlutoGridStateManager(
      columns: widget.plutoCols,
      rows: widget.gridrows,
      gridFocusNode: gridFocusNode,
      scroll: PlutoGridScrollController(
        vertical: verticalScroll,
        horizontal: horizontalScroll,
      ),
    );
  }

  void doubleColumnAdd() {
    gridBColumns.clear();
    gridBColumns.add(PlutoColumn(
      title: 'Longer text',
      field: 'dualColumn',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      renderer: (rendererContext) {
        return Obx(() => AutoSizeText(dualGridContent.value));
      },
    ));
  }

  IconButton detailIcon() {
    return IconButton(
        onPressed: () {
          gridBColumns.clear();
          gridBRows.clear();
          setState(() {});
        },
        icon: const Icon(
          Icons.close,
        ));
  }

  PlutoGrid singleGrid() {
    return PlutoGrid(
      columns: widget.plutoCols,
      rows: widget.gridrows,
      mode: PlutoGridMode.select,
      // columnGroups: columnGroups,
      onLoaded: (PlutoGridOnLoadedEvent event) {
        gridAStateManager = event.stateManager;
        event.stateManager.setShowColumnFilter(true);
      },

      onRowDoubleTap: (PlutoGridOnRowDoubleTapEvent event) async {
        currentRow_ = event.cell?.row.cells['row_']!.value;

        String dualColumn = event.cell!.column.field;
        dualGridContent.value = event.row!.cells[dualColumn]!.value;
        doubleColumnAdd();
        setState(() {});
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

  RxString dualGridContent = ''.obs;
  double fontSize = 25;
  final minWidth = 500.0;

  SingleChildScrollView dualWin() {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: max(screenWidth, minWidth),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: singleGrid(),
            ),
            const SizedBox(width: 30.0),
            Expanded(
              flex: 1,
              child: Obx(() => Text(
                    dualGridContent.value,
                    style: TextStyle(fontSize: fontSize),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: gridBColumns.isNotEmpty
            ? AppBar(
                title: ListTile(
                  leading: const Text('Dual mode'),
                  trailing: detailIcon(),
                ),
              )
            : null,
        body: gridBColumns.isEmpty ? singleGrid() : dualWin());
  }
}
