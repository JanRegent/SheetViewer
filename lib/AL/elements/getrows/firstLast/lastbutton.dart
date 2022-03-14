import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/__home/_loadingpage/getdatapage.dart';

import 'package:sheetviewer/BL/actionSheet/getdata_bl.dart';

import '_firstlastrow.dart';

IconButton lastButton(
    BuildContext context, String fileId, String sheetName, String fileTitle) {
  Future showGrid() async {
    Map getRowsMap = await getRowsMapFind(fileId, sheetName, 'getRowsLast');

    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              GetDataPage(fileId, sheetName, fileTitle, getRowsMap),
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

ElevatedButton lastRowsCount(BuildContext context, Function setStateFunc,
    String fileId, String sheetName) {
  return ElevatedButton(
    child: const Text('10'),
    style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 3, 244, 212)),
    onPressed: () async {
      await rowsCountSet(
          context, setStateFunc, fileId, sheetName, 'lastRowsCount');
    },
  );
}
