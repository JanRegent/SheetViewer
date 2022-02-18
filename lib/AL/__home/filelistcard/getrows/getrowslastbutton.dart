import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/views/gridview/_datagridpage.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

import 'package:sheetviewer/DL/loader/loader.dart';

ElevatedButton getRowsLastButton(BuildContext context, Function setStateFunc,
    String fileId, String sheetName, String fileTitle) {
  Future showGrid() async {
    await interestStore.updateString(
        'sheetName=$sheetName&vars=getlastRowsCount&fileId=$fileId', '21');
    setStateFunc();

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
