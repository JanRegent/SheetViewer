import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheetviewer/BL/actionSheet/getsheet.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

import 'package:sheetviewer/DL/getdata_models.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

List<dynamic> interestList = [];
List<String> interestTitles = [];

late Map interestRowCurrent;

List<Widget> dashboardPages = [];
RxString dashboardPageCurrent = ''.obs;

Future getDataInterests() async {
  logParagraphStart('getDataInterests');
  try {
    interestList = await localDb.read('interestList', List);
  } catch (e) {
    logi('getDataInterests', 'loadDb', 'error', e.toString());
  }
  if (interestList.isEmpty) {
    await getSheetInterests();
    interestList = await localDb.read('interestList', List);
  }
  interestTitlesGet();
  logi('interestTitles', 'loadDb', 'interestRowCurrent',
      interestTitles.join(', '));
  localDb.update('interestRowCurrent', interestList[0]);

  interestRowCurrent = await localDb.read('interestRowCurrent', Map);
  logi('getDataInterests', 'loadDb', 'interestRowCurrent',
      interestRowCurrent.toString());

  await getDataFilelistSheet();
}

Future getSheetInterests() async {
  try {
    logi('getSheetInterests', '1a getSheet', 'before request', '');
    Map responseData = await getSheet(
        'https://docs.google.com/spreadsheets/d/1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo/edit#gid=1211959017',
        'interestList');
    logi('getSheetInterests', '1b getSheet', 'after request',
        responseData.toString());
    if (responseData.isNotEmpty) {
      await localDb.update('interestList', responseData['rows']);
      await localDb.update('interestList__cols', responseData['cols']);
    }
  } catch (e) {
    logi('getSheetInterests', '2e getSheet', 'error', e.toString());
  }
}

void interestTitlesGet() {
  for (var i = 0; i < interestList.length; i++) {
    String interestName = interestList[i]['interestName'];
    if (interestTitles.contains(interestName)) continue;
    interestTitles.add(interestName);
  }
}

//----------------------------------------------------------filelist
List<SheetViewConfig> sheetViewConfigs = [];
late List<dynamic> fileListSheet = [];
RowsCountController rowsCountController = RowsCountController();

Future<String> getDataFilelistSheet() async {
  logParagraphStart('getDataFilelistSheet');
  interestRowCurrent = await localDb.read('interestRowCurrent', Map);
  logi('getDataFilelistSheet', 'loadDb', 'interestRowCurrent',
      interestRowCurrent.toString());

  Map responseData = await getSheet(
      interestRowCurrent['fileUrl'], interestRowCurrent['sheetName']);
  fileListSheet = responseData['rows'];
  logi('getDataFilelistSheet', 'loadDb', 'cols',
      responseData['cols'].toString());
  for (var i = 0; i < fileListSheet.length; i++) {
    rowsCountController.firstRowsCount.add(i + 10);
  }
  logi('getDataFilelistSheet', '', 'rowsCountController.firstRowsCount.length',
      rowsCountController.firstRowsCount.length.toString());

  sheetViewConfigs = await fileListSheet2sheetViewConfigs(
      fileListSheet, {'action': 'getRowsLast', 'rowsCount': '10'});

  logi('getDataFilelistSheet', '', 'sheetViewConfigs.length',
      sheetViewConfigs.length.toString());
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
