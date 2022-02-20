import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'getrowsallbutton.dart';
import 'getrowsfirstbutton.dart';
import 'getrowslastbutton.dart';

Row getRowsRow(
    BuildContext context, Function setStateFunc, Map fileListSheet, int index) {
  String fileId = bl.blUti.url2fileid(fileListSheet['rows'][index]['fileUrl']);
  String sheetName = fileListSheet['rows'][index]['sheetName'];
  String fileTitle = fileListSheet['rows'][index]['fileTitle'];
  return Row(
    children: [
      getRowsFirstCount(context, setStateFunc, fileId, sheetName),
      const Text(' '),
      getRowsFirstButton(context, fileId, sheetName, fileTitle),
      const Text(' '),
      getRowsAllButton(context, fileId, sheetName, fileTitle),
      const Text(' '),
      getRowsLastButton(context, fileId, sheetName, fileTitle),
      const Text(' '),
      getRowsLastCount(
        context,
        setStateFunc,
        fileId,
        sheetName,
      )
    ],
  );
}
