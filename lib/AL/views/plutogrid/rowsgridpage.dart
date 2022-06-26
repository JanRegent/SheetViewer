import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/AL/views/detailView/columnviewpage.dart';
import 'package:sheetviewer/AL/views/plutogrid/drawer.dart';
import 'package:sheetviewer/DL/isardb/sheetrows.dart';
import 'package:sheetviewer/DL/isardb/sheetview.dart';

import 'rows.dart';

/// The home page of the application which hosts the datagrid.
class RowsgridPage extends StatefulWidget {
  final List<PlutoColumn> cols;
  final List<PlutoRow> gridrows;
  final List<SheetRow?> rows;
  const RowsgridPage(this.cols, this.gridrows, this.rows, {Key? key})
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
      mode: PlutoGridMode.select,
      // columnGroups: columnGroups,
      onLoaded: (PlutoGridOnLoadedEvent event) {
        stateManager = event.stateManager;
        event.stateManager.setShowColumnFilter(true);
      },
      // onChanged: (PlutoGridOnChangedEvent event) {},
      onSelected: (PlutoGridOnSelectedEvent event) {
        //arrow down + Enter
        lorem = event
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
        // if (kDebugMode) {
        //   print('----------------------------onRowDoubleTap');
        //   print(event.cell?.column.field);
        //   print(event.cell?.row);
        // }

        if (event.cell?.column.field == '__rowDetail__') {
          await detailShow(
              widget.rows, event.cell?.row.cells['row_']!.value, context);
        } else {
          if (plutogridContr.multilineDetailLayuout.value ==
              event.cell!.column.field) {
            plutogridContr.multilineDetailLayuout.value = '';
          } else {
            plutogridContr.multilineDetailLayuout.value =
                event.cell!.column.field;

            lorem = event
                .row!.cells[plutogridContr.multilineDetailLayuout.value]!.value;
          }
          setState(() {});
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
                  lorem,
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
              child: plutoGrid(), //BoxDecoration
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
        body: plutogridContr.multilineDetailLayuout.value.isNotEmpty
            ? ColumnViewPage(SheetView())
            : plutoGrid());
  }
}

String lorem = '''
What is "Lorem ipsum"?
In publishing and graphic design, lorem ipsum is common placeholder text used to demonstrate the graphic elements of a document or visual presentation, such as web pages, typography, and graphical layout. It is a form of "greeking".

Even though using "lorem ipsum" often arouses curiosity due to its resemblance to classical Latin, it is not intended to have meaning. Where text is visible in a document, people tend to focus on the textual content rather than upon overall presentation, so publishers use lorem ipsum when displaying a typeface or design in order to direct the focus to presentation. "Lorem ipsum" also approximates a typical distribution of letters in English.
''';