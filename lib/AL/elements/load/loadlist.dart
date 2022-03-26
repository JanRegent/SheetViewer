import 'package:flutter/material.dart';

import 'package:sheetviewer/BL/bl.dart';

import 'dart:async';

import 'package:sheetviewer/DL/getdata_models.dart';

String loadListSheetName = 'space';
Map loadListFileListSheet = {};
IconButton loadList(Map fileListSheet) {
  return IconButton(
      onPressed: () async {
        await loadListByActions(loadListFileListSheet);
      },
      icon: const Icon(Icons.refresh));
}

List<String> actions = ['getRowsFirst', 'getRowsLast'];

Future loadListByActions(Map fileListSheet) async {
  for (var index = 0; index < fileListSheet['rows'].length; index++) {
    String fileId =
        bl.blUti.url2fileid(fileListSheet['rows'][index]['fileUrl']);
    String sheetName = fileListSheet['rows'][index]['sheetName'];
    for (var action in actions) {
      await sheetViewGetData(fileId, sheetName, action);
    }
  }
}
