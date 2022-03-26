import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/__home/_loadingpage/getdatapage.dart';
import 'package:sheetviewer/DL/getdata_models.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

import '_firstlastrow.dart';

IconButton lastButton(BuildContext context, String fileId, String sheetName,
    String fileTitle, SheetViewConfig sheetViewConfig) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GetDataPage(
              fileId, sheetName, fileTitle, 'getRowsLast', sheetViewConfig),
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
    String fileId, String sheetName, SheetViewConfig sheetViewConfig) {
  return ElevatedButton(
    child: Text(sheetViewConfig.getRowsLast.isNotEmpty
        ? sheetViewConfig.getRowsLast
        : '10'),
    style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 3, 244, 212)),
    onPressed: () async {
      var queryMap = {'action': 'getRowsLast', 'rowsCount': '10'};
      String aQuerystringKey = queryStringKeyBuild(fileId, sheetName, queryMap);

      await getRowsSet(context, setStateFunc, aQuerystringKey, 'getRowsLast',
          sheetViewConfig);
    },
  );
}
