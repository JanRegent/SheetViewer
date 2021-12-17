import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/views/gridview/_datagridpage.dart';
import 'package:sheetviewer/DL/loader/loader.dart';

ElevatedButton last5(
    BuildContext context, String fileId, String sheetName, String fileTitle) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DatagridPage(fileId, sheetName, fileTitle),
        ));
  }

  return ElevatedButton(
      child: const Icon(Icons.last_page),
      onPressed: () async {
        await showGrid();
      },
      onLongPress: () async {
        await getdatasheetRefresh(fileId, sheetName);
        await showGrid();
      });
}

ElevatedButton showAll(
    BuildContext context, String fileId, String sheetName, String fileTitle) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DatagridPage(fileId, sheetName, fileTitle),
        ));
  }

  return ElevatedButton(
      child: const Icon(Icons.all_inbox),
      onPressed: () async {
        await showGrid();
      },
      onLongPress: () async {
        await getdatasheetRefresh(fileId, sheetName);
        await showGrid();
      });
}
