import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/__home/_loadingpage/getdatapage.dart';
import 'package:sheetviewer/BL/datasheet/getdata_bl.dart';

ElevatedButton allRowsButton(
    BuildContext context, String fileId, String sheetName, String fileTitle) {
  Future showGrid() async {
    Map getRowsMap = await getRowsMapFind(fileId, sheetName, 'getSheet');
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              GetDataPage(fileId, sheetName, fileTitle, getRowsMap),
        ));
  }

  return ElevatedButton(
      child: const Icon(Icons.all_inbox),
      onPressed: () async {
        await showGrid();
      },
      onLongPress: () async {});
}
