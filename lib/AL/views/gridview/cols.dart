import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbycheckoxes.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/isardb/sheetview.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

PopupMenuButton popup(
    SheetView sheetView, BuildContext context, Function setState) {
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
              context, sheetView.cols, 'Select columns');
          if (result.isEmpty) return;
          sheetView.colsHeader = result;
          await interestStore2.updateListStringSheet(sheetView.sheetName,
              sheetView.fileId, 'colsHeader', sheetView.colsHeader);

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
          sheetView.colsHeader = sheetView.cols;

          await interestStore2.updateListStringSheet(sheetView.sheetName,
              sheetView.fileId, 'colsHeader', sheetView.colsHeader);
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

List<GridColumn> colsHeader(
    SheetView sheetView, BuildContext context, Function setState) {
  List<GridColumn> gridCols = [];
  gridCols.add(GridColumn(
      columnName: '__leftRowMenu__',
      width: 50,
      label: Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: popup(sheetView, context, setState))));
  for (var colIx = 0; colIx < sheetView.colsHeader.length; colIx++) {
    //print(sheetView.colsHeader[colIx]);
    gridCols.add(GridColumn(
        columnName: sheetView.colsHeader[colIx],
        label: Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(
              sheetView.colsHeader[colIx],
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
