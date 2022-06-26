import 'dart:convert';

import 'package:get/get.dart';
import 'package:sheetviewer/AL/views/plutogrid/drawer.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/DL/isardb/sheetrows.dart';

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
    print('--------------------');
    await filelistGetData(interestRowCurrent);
  }

  Future getSheetInterests() async {
    //try {
    String interestsSheetUrl = await loadAssetString('interestsSheetUrl');
    String interestsSheetName = await loadAssetString('interestsSheetName');
    if (dlGlobals.domain.toString().contains('vercel.app')) {
      interestsSheetUrl = remoteConfig.getString('interestsSheetUrl');
      interestsSheetName = remoteConfig.getString('interestsSheetName');
    }
    await appHome.updateString('interestsSheetUrl', interestsSheetUrl);
    await appHome.updateString('interestsSheetName', interestsSheetName);

    String interestFileId = bl.blUti.url2fileid(interestsSheetUrl);
    await dlGlobals.getSheetsService
        .getSheetAllRows(interestFileId, interestsSheetName);

    List<SheetRow?> interestRows =
        await sheetRowsDb.readRowsSheet(interestFileId, interestsSheetName);

    interestsList = [];
    for (var i = 1; i < interestRows.length; i++) {
      interestsList.add(jsonDecode(interestRows[i]!.row));
    }

    if (interestsList.isNotEmpty) {
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
      String fileId = bl.blUti.url2fileid(interestRowCurrent['fileUrl']);
      String sheetName = interestRowCurrent['sheetName'];
      await dlGlobals.getSheetsService.getSheetAllRows(fileId, sheetName);
      List<SheetRow?> filelistRows =
          await sheetRowsDb.readRowsSheet(fileId, sheetName);
      fileListSheet.clear();
      for (var i = 1; i < filelistRows.length; i++) {
        fileListSheet.add(jsonDecode(filelistRows[i]!.row));
      }

      await interestStore2.updateListDynamic('fileList', fileListSheet);
    }

    rowsCountController.firstRowsCount.clear();
    for (var i = 0; i < fileListSheet.length; i++) {
      rowsCountController.firstRowsCount.add(i + 10);
    }

    await getSheetsAll(fileListSheet);

    return 'ok';
  }

  String cardType = '';
  RxString fetshingRows = ''.obs;
  final String rowsCount = '10';
}

Future getSheetsAll(List<dynamic> fileListSheet) async {
  for (var i = 1; i < fileListSheet.length; i++) {
    String fileId = bl.blUti.url2fileid(fileListSheet[i]['fileUrl']);
    String sheetName = fileListSheet[i]['sheetName'];
    print('$sheetName  $fileId');
    int rowsCount = await sheetRowsDb.rowsCount(fileId, sheetName);
    if (rowsCount > 1) continue;

    await dlGlobals.getSheetsService.getSheetAllRows(fileId, sheetName);
  }
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
