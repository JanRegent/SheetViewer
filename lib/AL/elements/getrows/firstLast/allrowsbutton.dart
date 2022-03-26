import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/__home/_loadingpage/getdatapage.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

ElevatedButton allRowsButton(BuildContext context, String fileId,
    String sheetName, String fileTitle, SheetViewConfig sheetViewConfig) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GetDataPage(
              fileId, sheetName, fileTitle, 'getSheet', sheetViewConfig),
        ));
  }

  return ElevatedButton(
      child: const Icon(Icons.all_inbox),
      onPressed: () async {
        await showGrid();
      },
      onLongPress: () async {});
}
