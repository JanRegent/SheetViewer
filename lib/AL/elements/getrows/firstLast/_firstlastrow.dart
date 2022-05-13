import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/__home/interests/interests_controlers.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbyradiobuttons.dart';

import 'package:sheetviewer/BL/bl.dart';

import 'allrowsbutton.dart';
import 'firstbutton.dart';
import 'lastrow.dart';

Row firstLastRow(
    BuildContext context, int index, String sheetName, String fileId) {
  return Row(
    children: [
      firstRowsCount(context, sheetName, fileId),
      const Text(' '),
      firstButton(context, sheetName, fileId),
      const Text(' '),
      lastButton(context, sheetName, fileId),
      const Text(' '),
      lastRowsCount(context, sheetName, fileId),
      const Text(' '),
      allRowsButton(context, sheetName, fileId),
    ],
  );
}

Future getRowsSet(BuildContext context, int index, String sheetName,
    String fileId, String varName) async {
  List<String> values =
      List<String>.generate(10, (i) => ((i + 1) * 10).toString());
  String rowsCount = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SelectByRadiobuttonsPage('Select rows count value', values)));

  // ignore: unnecessary_null_comparison
  if (rowsCount == null) {
    return;
  }
  rowsCountController.firstRowsCountSet(index, rowsCount);

  await interestStore2.updateString(sheetName, fileId, 'firstRowsCount',
      rowsCountController.firstRowsCount[index]);

  //setStateFunc();
}
