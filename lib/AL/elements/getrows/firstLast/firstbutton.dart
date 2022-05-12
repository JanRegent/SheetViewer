import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheetviewer/AL/__home/interests/interests_controlers.dart';

import 'package:sheetviewer/AL/views/getdataviews.dart';

import 'package:sheetviewer/DL/isardb/sheetviewconfig.dart';

import '_firstlastrow.dart';

IconButton firstButton(BuildContext context, SheetViewConfig sheetViewConfig) {
  Future showGrid() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              GetDataViewsPage('getRowsFirst', sheetViewConfig),
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
    BuildContext context, int index, SheetViewConfig sheetViewConfig) {
  return ElevatedButton(
    child: Obx(
      () => Text(
        rowsCountController.firstRowsCount[index].toString(),
      ),
    ),
    style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 3, 244, 212)),
    onPressed: () async {
      await getRowsSet(context, index, sheetViewConfig.sheetName,
          sheetViewConfig.fileId, 'getRowsFirst', sheetViewConfig);
    },
  );
}
