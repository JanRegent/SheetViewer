import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/views/getdata_datagridpage.dart';

ElevatedButton allRowsButton(
    BuildContext context, String sheetName, String fileId) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              GetDataDatagridPage(sheetName, fileId, 'getSheet', 'txx'),
        ));
  }

  return ElevatedButton(
      child: const Icon(Icons.all_inbox),
      onPressed: () async {
        await showGrid();
      },
      onLongPress: () async {});
}
