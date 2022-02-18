import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';
import 'package:sheetviewer/Components/selectList/selectlistbycheckoxes.dart';

import '../../../BL/sheet/datasheet.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

PopupMenuButton popup(DataSheet dataSheet, BuildContext context,
    Function setState, String headerColsKey) {
  List<PopupMenuItem> menus = [];
  menus.add(PopupMenuItem(
    value: 'Origin data source show',
    child: InkWell(
      onTap: () async {
        Navigator.pop(context);
        // await canLaunch(dataSheet.config.sheetIds.fileIdUrl)
        //     ? await launch(dataSheet.config.sheetIds.fileIdUrl)
        //     : throw 'Could not launch ${dataSheet.config.sheetIds.fileIdUrl}';
      },
      child: const Text('Origin data source show1'),
    ),
  ));

  menus.add(PopupMenuItem(
      value: 'Select columns',
      child: IconButton(
        icon: const Icon(Icons.view_column_sharp),
        tooltip: 'Select columns',
        onPressed: () async {
          Navigator.pop(context);
          List<String> result = await selectListByCheckoxes(
              context, dataSheet.cols, 'Select columns');
          if (result.isEmpty) return;
          await interestStore.updateList(headerColsKey, result);
          dataSheet.headerCols = result;
          setState();
        },
      )));

  menus.add(PopupMenuItem(
      value: 'Reset columns',
      child: IconButton(
        icon: const Icon(Icons.view_column_outlined),
        tooltip: 'Reset columns',
        onPressed: () async {
          Navigator.pop(context);
          interestStore.deleteKey(headerColsKey);
          setState();
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

List<GridColumn> colsHeader(DataSheet dataSheet, BuildContext context,
    Function setState, String headerColsKey) {
  List<GridColumn> gridCols = [];
  gridCols.add(GridColumn(
      columnName: '__leftRowMenu__',
      width: 50,
      label: Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: popup(dataSheet, context, setState, headerColsKey))));
  for (var colIx = 0; colIx < dataSheet.headerCols.length; colIx++) {
    gridCols.add(GridColumn(
        columnName: dataSheet.headerCols[colIx],
        label: Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              dataSheet.headerCols[colIx],
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
