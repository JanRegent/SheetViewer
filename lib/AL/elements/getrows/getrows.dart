import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheetviewer/AL/__home/interests/interests_controler.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbyradiobuttons.dart';

import 'package:sheetviewer/AL/views/getdata_viewspage.dart';
import 'package:sheetviewer/BL/bl.dart';

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

IconButton lastButton(
    BuildContext context, String sheetName, String fileId, String fileTitle) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              GetDataViewsPage(sheetName, fileId, 'getRowsLast', fileTitle),
        ));
  }

  return IconButton(
    tooltip: 'Last 10 rows',
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

IconButton firstButton(
    BuildContext context, String sheetName, String fileId, String fileTitle) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              GetDataViewsPage(sheetName, fileId, 'getRowsFirst', fileTitle),
        ));
  }

  return IconButton(
    tooltip: 'First 10 rows',
    icon: Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        //borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Center(
        child: Icon(
          Icons.first_page,
          color: Colors.black,
        ),
      ),
    ),

    //color: Colors.lightBlue,
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
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              GetDataViewsPage(sheetName, fileId, 'getSheet', fileTitle),
        ));
  }

  return ElevatedButton(
      child: const Icon(Icons.table_rows_outlined),
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
