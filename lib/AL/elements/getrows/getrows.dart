import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheetviewer/AL/__home/interests/interests_controler.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbyradiobuttons.dart';

import 'package:sheetviewer/AL/views/getdata_viewspage.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/loader/getsheet.dart';

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

ElevatedButton lastButton(
    BuildContext context, String sheetName, String fileId, String fileTitle) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GetDataViewsPage(
              sheetName, fileId, 'getRowsLast', fileTitle, const []),
        ));
  }

  return ElevatedButton.icon(
    label: Text('Last ' + interestContr.rowsCount),
    icon: const Icon(Icons.last_page, color: Colors.black),
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
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GetDataViewsPage(
              sheetName, fileId, 'getRowsFirst', fileTitle, const []),
        ));
  }

  return ElevatedButton.icon(
    label: Text('First ' + interestContr.rowsCount),
    icon: const Icon(
      Icons.first_page,
      color: Colors.black,
    ),

    onPressed: () async {
      await showGrid();
    },
    // onLongPress: () async {
    //   await getRowsLastDelete(fileId, sheetName);
    // }
  );
}

ElevatedButton firstRowsCount(
    BuildContext context, String sheetName, String fileId) {
  return ElevatedButton(
    child: Obx(
      () => Text(
        rowsCountController.firstRowsCount[0].toString(),
      ),
    ),
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
  List<List<int>> getPlanInt = [];
  Future showGrid() async {
    Map getPlanResponse = await getSheetPlan(fileId, sheetName);
    List<dynamic> getPlan = getPlanResponse['rows'];
    if (getPlan.isNotEmpty) {
      int? rowsCount = int.tryParse(getPlan[getPlan.length - 1][1].toString());
      if (rowsCount! > 100) {
        for (var i = 0; i < getPlan.length; i++) {
          int fromNo = int.tryParse(getPlan[i][0].toString()) ?? 0;
          int toNo = int.tryParse(getPlan[i][1].toString()) ?? 0;

          getPlanInt.add([fromNo, toNo]);
        }
      }
    }

    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GetDataViewsPage(
              sheetName, fileId, 'getSheet', fileTitle, getPlanInt),
        ));
  }

  return ElevatedButton.icon(
      label: const Text('1000'),
      icon: const Icon(
        Icons.table_rows_outlined,
        color: Colors.black,
      ),
      onPressed: () async {
        await showGrid();
      },
      onLongPress: () async {});
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

// Future getRowsSet(
//   BuildContext context,
//   Function setStateFunc,
//   sheetName,
//   fileId,
//   String varName,
// ) async {
//   List<String> values =
//       List<String>.generate(10, (i) => ((i + 1) * 10).toString());
//   String rowsCount = await Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) =>
//               SelectByRadiobuttonsPage('Select rows count value', values)));

//   // ignore: unnecessary_null_comparison
//   if (rowsCount == null) {
//     return '10';
//   }

//   await interestStore2.updateStringSheet(
//       sheetName, fileId, 'getRowsLast', rowsCount);

//   setStateFunc();
// }
