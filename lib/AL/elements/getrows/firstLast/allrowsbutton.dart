import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/views/getdataviews.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

ElevatedButton allRowsButton(
    BuildContext context, SheetViewConfig sheetViewConfig) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GetDataViewsPage('getSheet', sheetViewConfig),
        ));
  }

  return ElevatedButton(
      child: const Icon(Icons.all_inbox),
      onPressed: () async {
        await showGrid();
      },
      onLongPress: () async {});
}
