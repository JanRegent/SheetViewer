import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../../BL/sheet/datasheet.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'detailView/DetailListViewPage.dart';

class RowsDataSource extends DataGridSource {
  final DataSheet dataSheet;
  final BuildContext context;

  RowsDataSource(this.dataSheet, this.context) {
    _stringRowsData = gridRows(dataSheet, context);
  }

  List<DataGridRow> gridRows(DataSheet anySheet, BuildContext context) {
    List<DataGridRow> gridrows = [];
    for (var rowIx = 0; rowIx < anySheet.rows.length; rowIx++) {
      gridrows.add(gridRow(anySheet, rowIx));
    }
    return gridrows;
  }

  DataGridRow gridRow(DataSheet dataSheet, int rowIx) {
    List<DataGridCell> cells = [];
    cells.add(DataGridCell<String>(columnName: 'S', value: rowIx.toString()));
    for (var colIx = 0; colIx < dataSheet.columnsSelected.length; colIx++) {
      String value = '';
      try {
        value = dataSheet.rows[rowIx][dataSheet.columnsSelected[colIx]];
      } catch (_) {
        value = '?';
      }
      cells.add(DataGridCell<String>(
          columnName: dataSheet.cols[colIx], value: value));
    }
    DataGridRow dataGridRow = DataGridRow(cells: cells);
    return dataGridRow;
  }

  List<DataGridRow> _stringRowsData = [];

  @override
  List<DataGridRow> get rows => _stringRowsData;

  ReadMoreText readmoreText(String value) {
    return ReadMoreText(
      value,
      trimLines: 2,
      colorClickableText: Colors.pink,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }

  Future detailShow(int rowIx) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailListViewPage(dataSheet, rowIx)),
    );
  }

  PopupMenuButton popup(DataGridCell<dynamic> e) {
    List<PopupMenuItem> menus = [];
    menus.add(PopupMenuItem(
      value: 'rowDetail',
      child: InkWell(
        onTap: () {
          int? rowIx = int.tryParse(e.value);
          Navigator.pop(context);
          detailShow(rowIx!);
        },
        child: const Text('Row detail'),
      ),
    ));
    menus.add(PopupMenuItem(
      value: 'xx',
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Text('button no XX'),
      ),
    ));
    return PopupMenuButton(
      initialValue: 2,
      child: const Center(child: Icon(Icons.menu)),
      itemBuilder: (context) {
        return menus;
      },
    );
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child:
            e.columnName != 'S' ? readmoreText(e.value.toString()) : popup(e),
      );
    }).toList());
  }
}
