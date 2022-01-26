import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/sheet/sheet_config.dart';
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

Set columnsGetUsed(SheetConfig sheetConfig, String endpointName) {
  List<String> configRows = [];
  if (endpointName.contains('getRows')) configRows = sheetConfig.getRows;
  if (endpointName.contains('select1')) configRows = sheetConfig.selects1;
  Set columns = {};
  for (var rowIx = 0; rowIx < configRows.length; rowIx++) {
    Map map = jsonDecode(configRows[rowIx]);
    map.forEach((key, value) {
      columns.add(key);
    });
    //rint(columns);
  }
  return columns;
}

List<GridColumn> colsHeader(
    SheetConfig sheetConfig, BuildContext context, String endpointName) {
  Set columnsSelected = columnsGetUsed(sheetConfig, endpointName);
  List<GridColumn> gridCols = [];
  columnWidths['__leftRowMenu__'] = 50;
  gridCols.add(GridColumn(
      columnName: '__leftRowMenu__',
      //width: 50,
      width: columnWidths['__leftRowMenu__']!,
      label: Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: null
          //popup(anySheet, context)
          )));

  for (var column in columnsSelected) {
    columnWidths[column] = double.nan;
    gridCols.add(GridColumn(
        columnName: column,
        width: columnWidths[column]!,
        label: Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              column,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
