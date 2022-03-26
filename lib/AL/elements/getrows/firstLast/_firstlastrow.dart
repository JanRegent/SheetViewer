import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbyradiobuttons.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

import 'allrowsbutton.dart';
import 'firstbutton.dart';
import 'lastbutton.dart';

Row firstLastRow(BuildContext context, Function setStateFunc, Map fileListSheet,
    int index, SheetViewConfig sheetViewConfig) {
  String fileId = bl.blUti.url2fileid(fileListSheet['rows'][index]['fileUrl']);
  String sheetName = fileListSheet['rows'][index]['sheetName'];
  String fileTitle = fileListSheet['rows'][index]['fileTitle'];

  return Row(
    children: [
      firstRowsCount(context, setStateFunc, fileId, sheetName, sheetViewConfig),
      const Text(' '),
      firstButton(context, fileId, sheetName, fileTitle, sheetViewConfig),
      const Text(' '),
      lastButton(context, fileId, sheetName, fileTitle, sheetViewConfig),
      const Text(' '),
      lastRowsCount(context, setStateFunc, fileId, sheetName, sheetViewConfig),
      const Text(' '),
      allRowsButton(context, fileId, sheetName, fileTitle, sheetViewConfig),
    ],
  );
}

Future getRowsSet(
    BuildContext context,
    Function setStateFunc,
    String aQuerystringKey,
    String varName,
    SheetViewConfig sheetViewConfig) async {
  List<String> values =
      List<String>.generate(10, (i) => ((i + 1) * 10).toString());
  String rowsCount = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SelectByRadiobuttonsPage('Select rows count value', values)));

  // ignore: unnecessary_null_comparison
  if (rowsCount == null) {
    sheetViewConfig.getRowsLast = '10';
    return;
  }
  sheetViewConfig.getRowsLast = rowsCount;
  await sheetViewConfigDb.getRowsSave(aQuerystringKey, varName, rowsCount);
  await sheetsDb.deleteSheet(aQuerystringKey);
  setStateFunc();
}
