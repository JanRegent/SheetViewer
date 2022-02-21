import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/views/gridview/_datagridpage.dart';

import 'bl_getrows.dart';
import 'getrows.dart';

IconButton getRowsLastButton(
    BuildContext context, String fileId, String sheetName, String fileTitle) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DatagridPage(fileId, sheetName, fileTitle, ''),
        ));
  }

  return IconButton(
    icon: Container(
      height: 100,
      width: 100,
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

ElevatedButton getRowsLastCount(BuildContext context, Function setStateFunc,
    String fileId, String sheetName) {
  return ElevatedButton(
    child: Text(getRowsReadString(fileId, sheetName, 'lastRowsCount', '10')),
    style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 3, 244, 212)),
    onPressed: () async {
      await rowsCountSet(
          context, setStateFunc, fileId, sheetName, 'lastRowsCount');
    },
  );
}
