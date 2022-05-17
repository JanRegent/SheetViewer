import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheetviewer/AL/__home/interests/interests_controler.dart';

import 'package:sheetviewer/AL/views/getdata_datagridpage.dart';

import '_firstlastrow.dart';

IconButton firstButton(
    BuildContext context, String sheetName, String fileId, String fileTitle) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              GetDataDatagridPage(sheetName, fileId, 'getRowsFirst', fileTitle),
        ));
  }

  return IconButton(
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

    //const Icon(Icons.),
    tooltip: 'First rows',
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
      await getRowsSet(context, 0, sheetName, fileId, 'getRowsFirst');
    },
  );
}
