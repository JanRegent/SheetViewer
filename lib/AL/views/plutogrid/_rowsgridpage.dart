import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/AL/views/detailView/columnviewpage.dart';
import 'package:sheetviewer/AL/views/plutogrid/drawer.dart';

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
  late PlutoGridStateManager gridBStateManager;
  final List<PlutoColumn> gridBColumns = [];
  final List<PlutoRow> gridBRows = [];
  Key? currentRowKey;

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
      // mode: widget.mode,
      // onChangedEventCallback: widget.onChanged,
      // onSelectedEventCallback: widget.onSelected,
      // createHeader: widget.createHeader,
      // createFooter: widget.createFooter,
      // configuration: widget.configuration,
    );
  }

  double fontSize = 25;
  Widget getText(String text) {
    TextStyle style = TextStyle(
      fontSize: fontSize,
    );

    return Text(
      text,
      style: style,
    );
  }

  void doubleColumnAdd(String cellText, String columnTitle) {
    gridBColumns.clear();
    gridBColumns.add(PlutoColumn(
      title: columnTitle,
      field: 'dualColumn',
      type: PlutoColumnType.text(),
    ));

    gridBRows.clear();
    PlutoRow plutoRow = PlutoRow(cells: {});
    plutoRow.cells
        .putIfAbsent('dualColumn', () => PlutoCell(value: getText(cellText)));
    gridBRows.add(plutoRow);
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
      // onChanged: (PlutoGridOnChangedEvent event) {},
      onSelected: (PlutoGridOnSelectedEvent event) {
        //arrow down + Enter
        cellText = event
            .row!.cells[plutogridContr.multilineDetailLayuout.value]!.value;
        setState(() {});
      },
      onRowSecondaryTap: (PlutoGridOnRowSecondaryTapEvent event) {
        if (kDebugMode) {
          print('----------------------------PlutoGridOnRowSecondaryTapEvent');
          print(event.cell?.column.field);
          print(event.cell?.row);
        }
      },
      onRowDoubleTap: (PlutoGridOnRowDoubleTapEvent event) async {
        currentRow_ = event.cell?.row.cells['row_']!.value;

        String dualColumn = event.cell!.column.field;
        cellText = event.row!.cells[dualColumn]!.value;

        doubleColumnAdd(cellText, dualColumn);
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

  void gridAHandler() {
    if (gridAStateManager.currentRow == null) {
      return;
    }

    if (gridAStateManager.currentRow!.key != currentRowKey) {
      currentRowKey = gridAStateManager.currentRow!.key;

      gridBStateManager.setShowLoading(true);

      //fetchUserActivity();
    }
  }

  PlutoDualGrid dualGrid() {
    return PlutoDualGrid(
      gridPropsA: PlutoDualGridProps(
        columns: widget.plutoCols,
        rows: widget.gridrows,
        onChanged: (PlutoGridOnChangedEvent event) {
          //print(event);
        },
        onLoaded: (PlutoGridOnLoadedEvent event) {
          gridAStateManager = event.stateManager;
          //stateManager = event.stateManager;
          event.stateManager.setShowColumnFilter(true);
          event.stateManager.addListener(gridAHandler);
        },
      ),
      gridPropsB: PlutoDualGridProps(
        columns: gridBColumns,
        rows: gridBRows,
        onChanged: (PlutoGridOnChangedEvent event) {
          //print(event);
        },
        onLoaded: (PlutoGridOnLoadedEvent event) {
          gridBStateManager = event.stateManager;
        },
        configuration: const PlutoGridConfiguration(),
      ),
      display: const PlutoDualGridDisplayRatio(ratio: 0.5),
    );
  }

  Center loremGrid() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.98,
                height: MediaQuery.of(context).size.height * 0.40,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AutoSizeText(
                  cellText,
                  style: const TextStyle(fontSize: 22),
                  minFontSize: 14,
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                  // overflowReplacement: const Text(
                  //     'Sorry String too long, use >| button at end of current row'),
                )),

            //Container
            //SizedBox

            Container(
              width: MediaQuery.of(context).size.width * 0.99,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.blue),
              child: singleGrid(), //BoxDecoration
            ), //Container
          ], //<widget>[]
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
        ), //Column
      ), //Container
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
        body: plutogridContr.multilineDetailLayuout.value.isNotEmpty
            ? ColumnViewPage(currentRow_, widget.cols, widget.sheetRows)
            : gridBColumns.isEmpty
                ? singleGrid()
                : dualGrid());
  }
}

String cellText = '''
What is "Lorem ipsum"?
In publishing and graphic design, lorem ipsum is common placeholder text used to demonstrate the graphic elements of a document or visual presentation, such as web pages, typography, and graphical layout. It is a form of "greeking".

Even though using "lorem ipsum" often arouses curiosity due to its resemblance to classical Latin, it is not intended to have meaning. Where text is visible in a document, people tend to focus on the textual content rather than upon overall presentation, so publishers use lorem ipsum when displaying a typeface or design in order to direct the focus to presentation. "Lorem ipsum" also approximates a typical distribution of letters in English.
''';
