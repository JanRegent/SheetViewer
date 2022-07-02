import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbyradiobuttons.dart';

import 'package:sheetviewer/AL/views/getdata_viewspage.dart';
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
//------------------------------------------------------------------------last

Row lastRow(
    BuildContext context, String sheetName, String fileId, String fileTitle) {
  return Row(
    children: [
      const Text(' '),
      lastRowsCount(context, sheetName, fileId),
      const Text(' '),
      lastButton(context, sheetName, fileId, fileTitle),
    ],
  );
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

  await interestStore2.updateStringSheet(
      sheetName, fileId, 'lastRowsCount', rowsCount);
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

ElevatedButton lastRowsCount(
    BuildContext context, String sheetName, String fileId) {
  return ElevatedButton(
    child: const Text('10'),
    style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 3, 244, 212)),
    onPressed: () async {
      await getRowsSet(context, sheetName, fileId, 'getRowsLast');
    },
  );
}

//------------------------------------------------------------------------first
Row firstRows(
    BuildContext context, String sheetname, String fileId, String fileTitle) {
  return Row(
    children: [
      firstRowsCount(context, sheetname, fileId),
      const Text(' '),
      firstButton(context, sheetname, fileId, fileTitle),
    ],
  );
}

ElevatedButton firstButton(
    BuildContext context, String sheetName, String fileId, String fileTitle) {
  return ElevatedButton.icon(
      label: Text('First ' + interestContr.rowsCount),
      icon: const Icon(
        Icons.first_page,
        color: Colors.black,
      ),
      onPressed: () async {
        await showGrid(context, sheetName, fileId, 'getRowsFirst', fileTitle);
      }
      // onLongPress: () async {
      //   await getRowsLastDelete(fileId, sheetName);
      // }
      );
}

ElevatedButton firstRowsCount(
    BuildContext context, String sheetName, String fileId) {
  return ElevatedButton(
    child: const Text('10'),
    style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 3, 244, 212)),
    onPressed: () async {
      await getRowsSet(context, sheetName, fileId, 'getRowsFirst');
    },
  );
}

//-------------------------------------------------------------------------all
Row allRows(
    BuildContext context, String sheetname, String fileId, String fileTitle) {
  return Row(
    children: [
      const Text('All '),
      allRowsButton(context, sheetname, fileId, fileTitle),
    ],
  );
}

ElevatedButton allRowsButton(
    BuildContext context, String sheetName, String fileId, String fileTitle) {
  return ElevatedButton.icon(
      label: const Text('1000'),
      icon: const Icon(
        Icons.table_rows_outlined,
        color: Colors.black,
      ),
      onPressed: () async {
        await showGrid(context, sheetName, fileId, 'getSheet', fileTitle);
      });
}

Row lastRows(
    BuildContext context, String sheetName, String fileId, String fileTitle) {
  return Row(
    children: [
      const Text(' '),
      lastRowsCount(context, sheetName, fileId),
      const Text(' '),
      lastButton(context, sheetName, fileId, fileTitle),
    ],
  );
}
