import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbyradiobuttons.dart';
import 'package:sheetviewer/AL/interests/interests_controlers.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

import 'firstbutton.dart';

Row firstRows(
    BuildContext context, int index, SheetViewConfig sheetViewConfig) {
  return Row(
    children: [
      firstRowsCount(context, index, sheetViewConfig),
      const Text(' '),
      firstButton(context, sheetViewConfig),
    ],
  );
}

Future getRowsSet(BuildContext context, int index, String aQuerystringKey,
    String varName, SheetViewConfig sheetViewConfig) async {
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
  rowsCountController.firstRowsCountSet(index, rowsCount);
  sheetViewConfig.getRowsLast = rowsCountController.firstRowsCount[index];
  await sheetViewConfigDb.getRowsSave(
      aQuerystringKey, varName, rowsCountController.firstRowsCount[index]);
  await sheetsDb.deleteSheet(aQuerystringKey);
  //setStateFunc();
}
