import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/components/selectList/selectlistbyradiobuttons.dart';

import 'bl_getrows.dart';
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
      getRowsLastButton(context, fileId, sheetName, fileTitle),
      const Text(' '),
      getRowsLastCount(
        context,
        setStateFunc,
        fileId,
        sheetName,
      ),
      const Text(' '),
      getRowsAllButton(context, fileId, sheetName, fileTitle),
    ],
  );
}

Future rowsCountSet(BuildContext context, Function setStateFunc, String fileId,
    String sheetName, String varName) async {
  List<String> values =
      List<String>.generate(10, (i) => ((i + 1) * 10).toString());
  String rowsCount = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SelectByRadiobuttonsPage('Select rows count value', values)));

  // ignore: unnecessary_null_comparison
  if (rowsCount == null) return;
  getRowsUpdateMap(fileId, sheetName, varName, rowsCount);
  setStateFunc();
}
