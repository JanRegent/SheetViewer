import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/views/getdataviews.dart';

import 'package:sheetviewer/DL/isardb/sheetviewconfig.dart';

import '_firstlastrow.dart';

IconButton lastButton(BuildContext context, SheetViewConfig sheetViewConfig) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              GetDataViewsPage('getRowsLast', sheetViewConfig),
        ));
  }

  return IconButton(
    icon: Container(
      height: 100,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        //borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Center(
        child: Icon(Icons.last_page, color: Colors.black),
      ),
    ),
    tooltip: 'Last rows',
    onPressed: () async {
      await showGrid();
    },
  );
}

ElevatedButton lastRowsCount(
    BuildContext context, int index, SheetViewConfig sheetViewConfig) {
  return ElevatedButton(
    child: Text(sheetViewConfig.getRowsLast.isNotEmpty
        ? sheetViewConfig.getRowsLast
        : '10'),
    style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 3, 244, 212)),
    onPressed: () async {
      await getRowsSet(context, index, sheetViewConfig.sheetName,
          sheetViewConfig.fileId, 'getRowsLast', sheetViewConfig);
    },
  );
}
