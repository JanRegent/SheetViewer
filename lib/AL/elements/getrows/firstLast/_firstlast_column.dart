import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbyradiobuttons.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

import 'allrowsbutton.dart';
import 'firstbutton.dart';
import 'lastbutton.dart';

Column firstLastColumn(BuildContext context, Function setStateFunc,
    SheetViewConfig sheetViewConfig) {
  return Column(
    children: [
      Row(
        children: [
          const Text(' '),
          firstRowsCount(context, setStateFunc, sheetViewConfig),
          const Text(' '),
          firstButton(context, sheetViewConfig),
        ],
      ),
      Row(
        children: [
          const Text(' '),
          lastRowsCount(context, setStateFunc, sheetViewConfig),
          const Text(' '),
          lastButton(context, sheetViewConfig),
        ],
      ),
      Row(children: [
        const Text(' '),
        allRowsButton(context, sheetViewConfig),
        const Text('   All'),
      ])
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