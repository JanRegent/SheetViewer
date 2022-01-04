import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../BL/sheet/datasheet.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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
    child: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(Icons.search),
    ),
  ));
  return PopupMenuButton(
    initialValue: 2,
    child: const Center(child: Icon(Icons.ac_unit)),
    itemBuilder: (context) {
      return menus;
    },
  );
}

List<GridColumn> colsHeader(DataSheet anySheet, BuildContext context) {
  List<GridColumn> gridCols = [];
  gridCols.add(GridColumn(
      columnName: '__leftRowMenu__',
      width: 50,
      label: Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: popup(anySheet, context))));
  for (var colIx = 0; colIx < anySheet.config.columnsSelected.length; colIx++) {
    gridCols.add(GridColumn(
        columnName: anySheet.config.columnsSelected[colIx],
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
