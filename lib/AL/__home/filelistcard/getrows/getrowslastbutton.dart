import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/views/gridview/_datagridpage.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

import 'package:sheetviewer/DL/loader/loader.dart';

ElevatedButton getRowsLastButton(
    BuildContext context, String fileId, String sheetName, String fileTitle) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DatagridPage(fileId, sheetName, fileTitle, ''),
        ));
  }

  return ElevatedButton(
      child: const Icon(Icons.last_page),
      onPressed: () async {
        await showGrid();
      },
      onLongPress: () async {
        await getRowsLastDelete(fileId, sheetName);
      });
}

ElevatedButton getRowsLastCount(BuildContext context, Function setStateFunc,
    String fileId, String sheetName) {
  Future showGrid() async {
    await interestStore.updateString(
        'sheetName=$sheetName&vars=getlastRowsCount&fileId=$fileId', '23');
    setStateFunc();
  }

  return ElevatedButton(
    child: Text(interestStore.readStringDefault(
        'sheetName=$sheetName&vars=getlastRowsCount&fileId=$fileId', '11')),
    style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 3, 244, 212)),
    onPressed: () async {
      await showGrid();
    },
  );
}
