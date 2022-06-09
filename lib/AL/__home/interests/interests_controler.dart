import 'dart:convert';

import 'package:get/get.dart';
import 'package:sheetviewer/AL/views/plutogrid/drawer.dart';
import 'package:sheetviewer/DL/loader/fire_reader.dart';

import 'package:sheetviewer/DL/loader/getsheet.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';

import 'package:sheetviewer/DL/localstore/localstore.dart';

class InterestContr extends GetxController {
  var interestName = ''.obs;

  Future interestNameSet(String value) async {
    interestName.value = value;

    interestStore2 = LocalStore('interest: ' + interestName.value);
    await interestStore2.init();
  }

  //-----------------------------------------------------------------init/load
  List<dynamic> interestsList = [];
  Future interestsLoad() async {
    logParagraphStart('interestsLoad');

    // try {
    //   interestsList = await appHome.readListDynamic('interestList', []);
    // } catch (e) {
    //   if (interestsList.isNotEmpty) {
    //     logi('interestsLoad()', 'appHome.readListDynamic( interestList',
    //         'error', e.toString());
    //   } else {
    //     logi('interestsLoad()', 'appHome.readListDynamic( interestList', '',
    //         'interestsList.isEmpty');
    //   }
    // }

    if (interestsList.isEmpty) {
      interestsList = await getSheetInterests();
      await appHome.updateListDynamic('interestList', interestsList);
    }
    interestSet(0);

    interestTitlesGet();
  }

  late Map interestRowCurrent;
  Future interestSet(int interestIndex) async {
    plutogridContr.multilineDetailLayuout.value = '';

    interestRowCurrent = interestsList[interestIndex];

    logParagraphStart('interestSet');
    logi(
        'interestSet(', '', 'interestName', interestRowCurrent['interestName']);

    await interestContr.interestNameSet(interestRowCurrent['interestName']);

    appHome.updateMap('interestRowCurrent', interestRowCurrent);

    await filelistGetData(interestRowCurrent);
  }

  Future getSheetInterests() async {
    //try {
    String interestsSheetUrl = await interestsSheetUrlAtFire();
    String interestsSheetName = await interestsSheetNameAtFire();
    var response = await getSheetUrl(interestsSheetUrl, interestsSheetName);

    Map<String, dynamic> res = jsonDecode(response.toString());
    // } catch (e) {
    //   print(response.body);
    //   logi('getSheetInterests', '1e request getSheet', 'error', e.toString());
    //   // responseData = await getSheet(
    //   //     'https://docs.google.com/spreadsheets/d/1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo/edit#gid=1211959017',
    //   //     'interestList');
    // }

    interestsList = [];

    if (res.containsKey("rows")) {
      interestsList = res['rows'];

      return interestsList;
    }
    logi('getSheetInterests', '2e update interests', 'error', '');
    return [];
  }

  //----------------------------------------------------------------titles
  List<String> titles = [];
  void interestTitlesGet() {
    titles.clear();
    for (var i = 0; i < interestsList.length; i++) {
      String interestName = interestsList[i]['interestName'];
      if (titles.contains(interestName)) continue;
      titles.add(interestName);
    }
  }

  //----------------------------------------------------------intertest FileList

  late List<dynamic> fileListSheet = [];
  Future<String> filelistGetData(Map interestRowCurrent) async {
    logParagraphStart('getDataFilelistSheet');

    try {
      fileListSheet = await interestStore2.readListDynamic('fileList', []);
    } catch (e) {
      logi('interestFilelistGetData', 'readListDynamic(fileList', 'error',
          e.toString());
      logi('interestFilelistGetData', 'data:', 'fileListSheet',
          fileListSheet.toString());
    }

    if (fileListSheet.isEmpty) {
      Map responseData = await getSheet(
          interestRowCurrent['fileUrl'], interestRowCurrent['sheetName']);
      fileListSheet = responseData['rows'];
      await interestStore2.updateListDynamic('fileList', fileListSheet);
    }

    rowsCountController.firstRowsCount.clear();
    for (var i = 0; i < fileListSheet.length; i++) {
      rowsCountController.firstRowsCount.add(i + 10);
    }

    return 'ok';
  }

  String cardType = '';
  RxString fetshingRows = ''.obs;
  final String rowsCount = '10';
}

RowsCountController rowsCountController = RowsCountController();

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
