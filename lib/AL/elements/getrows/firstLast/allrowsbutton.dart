import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/views/getdataviews.dart';

ElevatedButton allRowsButton(
    BuildContext context, String sheetName, String fileId) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GetDataViewsPage(sheetName, fileId, 'getSheet'),
        ));
  }

  return ElevatedButton(
      child: const Icon(Icons.all_inbox),
      onPressed: () async {
        await showGrid();
      },
      onLongPress: () async {});
}
