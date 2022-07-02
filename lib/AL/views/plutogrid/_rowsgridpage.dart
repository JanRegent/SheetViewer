import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:sheetviewer/DL/isardb/sheetrows.dart';

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

  String detailColumnField = '';

  @override
  void initState() {
    getDetailList('2');
    super.initState();
    initStateManager();
  }

  late PlutoGridStateManager gridAStateManager;

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

  List<PlutoColumn> getFilteredColumns() {
    return gridAStateManager.refColumns.where((e) {
      return gridAStateManager.isFilteredColumn(e);
    }).toList();
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

        gridAStateManager.eventManager!.listener((event) {
          if (event is PlutoGridChangeColumnFilterEvent) {}
        });

        if (!widget.cols.contains('Mise')) return;
        PlutoRow filter = PlutoRow(cells: {
          FilterHelper.filterFieldColumn: PlutoCell(
            value: 'Mise',
          ),
          FilterHelper.filterFieldType: PlutoCell(
            value: const PlutoFilterTypeContains(),
          ),
          FilterHelper.filterFieldValue: PlutoCell(
            value: 'ax',
          ),
        });
        filterRows.add(filter);
        handleLoadFilter();

        if (_controller.hasClients) {
          gridAStateManager.scroll!.setBodyRowsVertical(_controller);
        }
      },
      onRowDoubleTap: (PlutoGridOnRowDoubleTapEvent event) async {
        detailRowNo.value = event.cell!.row.cells.values.first.value.toString();
        getDetailList(detailRowNo.value);
        detailColumnField = event.cell!.column.field;

        detailContent.value = event.row!.cells[detailColumnField]!.value;
        gridAStateManager.notifyListeners();
        handleSaveFilter();
        // print('----------------------------------');
        // int page = gridAStateManager.page;
        // print(page);
        //setState(() {});
        //gridAStateManager.setPage(page);

        gridAStateManager.notifyListeners();
        //handleLoadFilter();
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
            } else if (column.field == 'number') {
              return resolver<PlutoFilterTypeGreaterThan>() as PlutoFilterType;
            } else if (column.field == 'date') {
              return resolver<PlutoFilterTypeLessThan>() as PlutoFilterType;
            } else if (column.field == 'select') {
              return resolver<ClassYouImplemented>() as PlutoFilterType;
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

  SheetRow? getRowByRowNo(String rowNo) {
    for (var i = 0; i < widget.sheetRows.length; i++) {
      if (widget.sheetRows[i]!.aRowNo == rowNo) return widget.sheetRows[i];
    }
    return widget.sheetRows[1];
  }

  RxString detailContent = ''.obs;
  RxString detailRowNo = '2'.obs;
//  RxMap rxRow = {}.obs;
  RxList detailList = [].obs;
  RxList getDetailList(String rowNo) {
    SheetRow? sheetRow = getRowByRowNo(rowNo);
    Map row = jsonDecode(sheetRow!.row);
    detailList.clear();
    for (var key in row.keys) {
      detailList.add([key, row[key]]);
    }
    return detailList;
  }

  Widget detailBody() {
    List<Widget> colItems() {
      List<Widget> items = [];
      items.add(Obx(() => Text(
            detailContent.value,
            style: TextStyle(fontSize: fontSize),
          )));
      items.add(const Divider(color: Colors.blue));
      items.add(ListTile(
        leading: const Text('RowNo: '),
        title: Obx(() => Text(detailRowNo.value)),
      ));
      int key = 0;
      int value = 1;
      for (var i = 0; i < detailList.length; i++) {
        if (detailColumnField == detailList[i][key]) {
          continue;
        } //is at first position yet
        try {
          items.add(ListTile(
            leading: Obx(() => Text(detailList[i][key] + ': ')),
            title: Obx(() => Text(detailList[i][value].toString())),
          ));
          items.add(const Divider(color: Colors.blue));
        } catch (_) {}
      }
      return items;
    }

    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey[50],
        child: ListView(
          controller: _controller,
          children: colItems(),
        ));
  }

  double fontSize = 25;
  final minWidth = 500.0;

  SingleChildScrollView detailWin() {
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
            Expanded(flex: 1, child: detailBody()),
          ],
        ),
      ),
    );
  }

  //------------------------------------------------------------- filterRows
  final List<PlutoRow> filterRows = [];
  void handleSaveFilter() {
    filterRows.clear();

    final List<PlutoRow> filters = gridAStateManager.filterRows
        .map(
          (e) => PlutoRow(cells: {
            FilterHelper.filterFieldColumn: PlutoCell(
              value: e.cells[FilterHelper.filterFieldColumn]!.value,
            ),
            FilterHelper.filterFieldType: PlutoCell(
              value: e.cells[FilterHelper.filterFieldType]!.value,
            ),
            FilterHelper.filterFieldValue: PlutoCell(
              value: e.cells[FilterHelper.filterFieldValue]!.value,
            ),
          }),
        )
        .toList();
    if (filters.isEmpty) return;
    // print(filters[0].cells.keys);
    // print(filters[0].cells['column']!.value);
    // print(filters[0].cells['type']!.value);
    // print(filters[0].cells['value']!.value);

    filterRows.addAll(filters);
  }

  void handleLoadFilter() {
    gridAStateManager.gridFocusNode?.unfocus();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      gridAStateManager.setFilterWithFilterRows(filterRows);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: detailMode ? detailWin() : singleGrid());
  }
}

class ClassYouImplemented implements PlutoFilterType {
  @override
  String get title => 'Custom contains';

  @override
  get compare => ({
        required String? base,
        required String? search,
        required PlutoColumn? column,
      }) {
        var keys = search!.split(',').map((e) => e.toUpperCase()).toList();

        return keys.contains(base!.toUpperCase());
      };

  const ClassYouImplemented();
}
