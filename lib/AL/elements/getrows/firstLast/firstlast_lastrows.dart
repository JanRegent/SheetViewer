import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbyradiobuttons.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

import 'lastbutton.dart';

Row lastRows(BuildContext context, int index, SheetViewConfig sheetViewConfig) {
  return Row(
    children: [
      const Text(' '),
      lastRowsCount(context, index, sheetViewConfig),
      const Text(' '),
      lastButton(context, sheetViewConfig),
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
