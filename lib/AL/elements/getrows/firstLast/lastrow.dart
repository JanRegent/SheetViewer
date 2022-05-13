import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbyradiobuttons.dart';
import 'package:sheetviewer/AL/views/getdataviews.dart';
import 'package:sheetviewer/BL/bl.dart';

Row lastRow(BuildContext context, String sheetName, String fileId) {
  return Row(
    children: [
      const Text(' '),
      lastRowsCount(context, sheetName, fileId),
      const Text(' '),
      lastButton(context, sheetName, fileId),
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

  await interestStore2.updateVar(sheetName, fileId, 'lastRowsCount', rowsCount);
}

IconButton lastButton(BuildContext context, String sheetName, String fileId) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              GetDataViewsPage(sheetName, fileId, 'getRowsLast'),
        ));
  }

  return IconButton(
    icon: Container(
      height: 100,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        //borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Center(
        child: Icon(Icons.last_page, color: Colors.black),
      ),
    ),
    tooltip: 'Last rows',
    onPressed: () async {
      await showGrid();
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
