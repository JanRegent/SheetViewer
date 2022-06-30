import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:sheetviewer/DL/isardb/sheetrows.dart';

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
  late ScrollController _controller;

  late Map<String, PlutoCell> currentRow_;
  String currentColumnField = '';
  bool detailMode = false;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
    initStateManager();
    currentRow_ = widget.gridrows.first.cells;
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

  IconButton detailIcon() {
    return IconButton(
        onPressed: () {
          detailMode = false;
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
        currentRow_ = event.cell!.row.cells;

        currentColumnField = event.cell!.column.field;
        print(currentColumnField);
        detailContent.value = event.row!.cells[currentColumnField]!.value;
        detailMode = true;
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

  Widget detailBody() {
    List<Widget> colItems() {
      List<Widget> items = [];
      items.add(Obx(() => Text(
            detailContent.value,
            style: TextStyle(fontSize: fontSize),
          )));
      items.add(const Divider(color: Colors.blue));
      for (var entry in currentRow_.entries) {
        if (currentColumnField == entry.value.column.title) continue;
        items.add(ListTile(
          leading: Text(entry.value.column.title + ': '),
          title: Text(entry.value.value.toString()),
        ));
        items.add(const Divider(color: Colors.blue));
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

  RxString detailContent = ''.obs;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: detailMode
            ? AppBar(
                title: ListTile(
                  leading: const Text('Detail view'),
                  trailing: detailIcon(),
                ),
              )
            : null,
        body: detailMode ? detailWin() : singleGrid());
  }
}
