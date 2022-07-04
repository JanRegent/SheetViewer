import 'package:flutter/material.dart';

import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:resizable_widget/resizable_widget.dart';

import 'package:sheetviewer/DL/isardb/sheetrows.dart';

import 'detailpanel.dart';
import 'drawer.dart';
import 'filters.dart';

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
    initStateManager();
  }

  void setStateFunc() {
    setState(() {});
  }

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
        filtersInit(widget.cols);
        handleLoadFilter(gridAStateManager);

        gridAStateManager.addListener(onSelectHandle);

        if (_controller.hasClients) {
          gridAStateManager.scroll!.setBodyRowsVertical(_controller);
        }
      },
      onRowDoubleTap: (PlutoGridOnRowDoubleTapEvent event) async {
        gridAStateManager.notifyListeners();
        handleSaveFilter(gridAStateManager);
        // print('----------------------------------');
        // int page = gridAStateManager.page;
        // print(page);
        //setState(() {});
        //gridAStateManager.setPage(page);

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

  void onSelectHandle() {
    // print(gridAStateManager.currentCell!.value);
    // print(gridAStateManager.currentRow!.key);
    // print(gridAStateManager.currentColumn!.title);
    detailRowNo.value =
        gridAStateManager.currentCell!.row.cells.values.first.value.toString();
    getDetailList(detailRowNo.value, widget.sheetRows);
    detailColumnField = gridAStateManager.currentColumn!.title;

    detailContent.value = gridAStateManager.currentCell!.value;
  }

  ResizableWidget resizablePanels() {
    return ResizableWidget(
      children: [
        // required
        singleGrid(),
        detailWin()
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

  SingleChildScrollView detailWin() {
    final screenWidth = MediaQuery.of(context).size.width;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: detailMode ? resizablePanels() : singleGrid());
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
