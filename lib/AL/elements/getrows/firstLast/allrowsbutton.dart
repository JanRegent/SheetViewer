import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/views/getdata_viewspage.dart';

ElevatedButton allRowsButton(
    BuildContext context, String sheetName, String fileId, String fileTitle) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              GetDataViewsPage(sheetName, fileId, 'getSheet', fileTitle),
        ));
  }

  return ElevatedButton(
      child: const Icon(Icons.all_inbox),
      onPressed: () async {
        await showGrid();
      },
      onLongPress: () async {});
}
