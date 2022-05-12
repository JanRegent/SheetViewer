import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/views/getdataviews.dart';

import '_firstlastrow.dart';

IconButton lastButton(BuildContext context, String sheetName, String fileId) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              GetDataViewsPage('getRowsLast', sheetName, fileId),
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
    BuildContext context, String sheetName, String fileId) {
  return ElevatedButton(
    child: const Text('10'),
    style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 3, 244, 212)),
    onPressed: () async {
      await getRowsSet(context, 0, sheetName, fileId, 'getRowsLast');
    },
  );
}
