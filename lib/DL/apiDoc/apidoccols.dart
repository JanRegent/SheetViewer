import 'package:flutter/material.dart';
import 'package:sheetviewer/Components/selectList/selectlistbycheckoxes.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../BL/sheet/datasheet.dart';

PopupMenuButton popup(DataSheet anySheet, BuildContext context) {
  List<PopupMenuItem> menus = [];
  menus.add(PopupMenuItem(
    value: 'Origin data source show',
    child: InkWell(
      onTap: () async {
        Navigator.pop(context);
        await canLaunch(anySheet.config.sheetUrl)
            ? await launch(anySheet.config.sheetUrl)
            : throw 'Could not launch ${anySheet.config.sheetUrl}';
      },
      child: const Text('Origin data source show'),
    ),
  ));

  menus.add(PopupMenuItem(
      value: 'xx',
      child: IconButton(
        icon: const Icon(Icons.view_column_sharp),
        tooltip: 'Select columns',
        onPressed: () async {
          Navigator.pop(context);
          List<String> result = await selectListByCheckoxes(
              context, anySheet.cols, 'Select columns');
          if (result.isEmpty) return;
          anySheet.config.columnsSelected = result;
        },
      )));
  return PopupMenuButton(
    initialValue: 2,
    child: const Center(child: Icon(Icons.ac_unit)),
    itemBuilder: (context) {
      return menus;
    },
  );
}

late Map<String, double> columnWidths = {};

List<GridColumn> colsHeader(DataSheet anySheet, BuildContext context) {
  List<GridColumn> gridCols = [];
  columnWidths['__leftRowMenu__'] = 50;
  gridCols.add(GridColumn(
      columnName: '__leftRowMenu__',
      //width: 50,
      width: columnWidths['__leftRowMenu__']!,
      label: Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: popup(anySheet, context))));

  for (var colIx = 0; colIx < anySheet.config.columnsSelected.length; colIx++) {
    columnWidths[anySheet.config.columnsSelected[colIx]] = double.nan;
    gridCols.add(GridColumn(
        columnName: anySheet.config.columnsSelected[colIx],
        width: columnWidths[anySheet.config.columnsSelected[colIx]]!,
        label: Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              anySheet.config.columnsSelected[colIx],
            ))));
  }
  gridCols.add(GridColumn(
      columnName: '__rowDetail__',
      width: 50,
      label: Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ))));
  return gridCols;
}
