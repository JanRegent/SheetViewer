import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbyradiobuttons.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'lastbutton.dart';

Column lastColumn(BuildContext context, String sheetName, String fileId) {
  return Column(
    children: [
      Row(
        children: [
          const Text(' '),
          lastRowsCount(context, sheetName, fileId),
          const Text(' '),
          lastButton(context, sheetName, fileId),
        ],
      ),
    ],
  );
}

Future getRowsSet(BuildContext context, Function setStateFunc, String sheetName,
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
    return '10';
  }

  await interestStore2.updateVar(sheetName, fileId, 'lastRowsCount', rowsCount);

  setStateFunc();
}
