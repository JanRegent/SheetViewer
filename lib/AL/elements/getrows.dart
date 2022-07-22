import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbyradiobuttons.dart';

import 'package:sheetviewer/AL/views/getdata_gridpage.dart';
import 'package:sheetviewer/BL/bl.dart';

//------------------------------------------------------------------------all
Future getrowsRefresh(String fileUrl, String sheetName) async {
  // String fileId = bl.blUti.url2fileid(fileUrl);
  // for (var action in ['getRowsFirst', 'getRowsLast']) {
  //   Map queryMap = await actionMapCreate(fileId, sheetName, action);

  //   String queryStringKey = queryStringKeyBuild(fileId, sheetName, queryMap);
  //   await sheetsDb.deleteSheet(queryStringKey);
  // }
}

Future getRowsSet(BuildContext context, String sheetName, String fileId,
    String varName) async {
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
}

Future showGrid(BuildContext context, String sheetName, String fileId,
    String action, String fileTitle) async {
  await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            GetDataViewsPage(sheetName, fileId, action, fileTitle),
      ));
}

ElevatedButton lastButton(
    BuildContext context, String sheetName, String fileId, String fileTitle) {
  return ElevatedButton.icon(
    label: Text('Last ' + interestContr.rowsCount),
    icon: const Icon(Icons.last_page, color: Colors.black),
    onPressed: () async {
      await showGrid(context, sheetName, fileId, 'getRowsLast', fileTitle);
    },
  );
}

//-------------------------------------------------------------------------all

ElevatedButton allRowsButton(
    BuildContext context, String sheetName, String fileId, String fileTitle) {
  return ElevatedButton.icon(
      label: const Text('all rows'),
      icon: const Icon(
        Icons.table_rows_outlined,
        color: Colors.black,
      ),
      onPressed: () async {
        await showGrid(context, sheetName, fileId, 'getSheet', fileTitle);
      });
}
