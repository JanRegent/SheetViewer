import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbycheckoxes.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/isardb/sheetview.dart';

import 'package:pluto_grid/pluto_grid.dart';

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

Future<List<PlutoColumn>> colsHeader(List<String> colsHeader) async {
  List<PlutoColumn> gridCols = [];
  gridCols.add(PlutoColumn(
    title: 'row_',
    field: 'row_',
    width: 60,
    type: PlutoColumnType.text(),
  ));

  for (var colIx = 0; colIx < colsHeader.length; colIx++) {
    gridCols.add(PlutoColumn(
        title: colsHeader[colIx],
        field: colsHeader[colIx],
        type: PlutoColumnType.text(),
        readOnly: true));
  }

  gridCols.add(PlutoColumn(
    title: '>',
    field: '__rowDetail__',
    type: PlutoColumnType.text(),
  ));

  return gridCols;
}
