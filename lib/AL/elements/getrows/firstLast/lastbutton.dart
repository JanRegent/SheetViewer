import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/pages/views/gridview/_datagridpage.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/sheet/sheet_config.dart';

import '_firstlastrow.dart';

Future<Map> getRowsMapFind(
    String fileId, String sheetName, String action) async {
  String sheetKey = SheetConfig().getKey(sheetName, fileId);
  SheetConfig? sheetConfig = await sheetConfigDb.readSheet(sheetKey);
  Map getRowsMap = {"action": action, "rowsCount": 10};
  for (var i = 0; i < sheetConfig!.getRows.length; i++) {
    Map map = jsonDecode(sheetConfig.getRows[i]);
    if (map['action'] == action) {
      getRowsMap = map;
      break;
    }
  }
  return getRowsMap;
}

IconButton lastButton(
    BuildContext context, String fileId, String sheetName, String fileTitle) {
  Future showGrid() async {
    Map getRowsMap = await getRowsMapFind(fileId, sheetName, 'getRowsLast');
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DatagridPage(fileId, sheetName, fileTitle, getRowsMap),
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
