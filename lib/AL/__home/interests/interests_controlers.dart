import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sheetviewer/BL/actionSheet/getsheet.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

import 'package:sheetviewer/DL/localstore/localstore.dart';

List<dynamic> interestList = [];
List<String> interestTitles = [];

late Map interestRowCurrent;

List<Widget> dashboardPages = [];
RxString dashboardPageCurrent = ''.obs;

late LocalStore interestStore;

//----------------------------------------------------------filelist

late List<dynamic> fileListSheet = [];
RowsCountController rowsCountController = RowsCountController();

Future<String> getDataFilelistSheet(Map interestRowCurrent) async {
  logParagraphStart('getDataFilelistSheet');

  Map responseData = await getSheet(
      interestRowCurrent['fileUrl'], interestRowCurrent['sheetName']);
  fileListSheet = responseData['rows'];

  await interestStore2.updateListDynamic('', '', 'fileList', fileListSheet);

  for (var i = 0; i < fileListSheet.length; i++) {
    rowsCountController.firstRowsCount.add(i + 10);
  }

  return 'ok';
}

class RowsCountController extends GetxController {
  var firstRowsCount = [].obs;

  int firstRowsCountGet(int index) {
    return 11;
    // firstRowsCount[index];
  }

  firstRowsCountAdd() {
    firstRowsCount.add(11);
  }

  firstRowsCountSet(int index, value) {
    firstRowsCount[index] = value;
  }

  var lastRowsCount = [].obs;

  int lastRowsCountGet(int index) {
    return lastRowsCount[index];
  }

  lastRowsCountSet(int index, value) {
    lastRowsCount[index] = value;
  }
}

InterestController interestController = InterestController();

class InterestController extends GetxController {
  var interestName = ''.obs;
  Future interestNameSet(String value) async {
    logParagraphStart('interestNameSet');
    interestName.value = value;
    interestStore2 = LocalStore('interest: ' + interestName.value);
    await interestStore2.init();
  }

  String interestNameGet() {
    return interestName.value;
  }
}
