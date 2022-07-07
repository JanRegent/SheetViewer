import 'dart:convert';

import 'package:get/get.dart';
import 'package:sheetviewer/AL/views/plutogrid/drawer.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/DL/isardb/filelist.dart';

import 'package:sheetviewer/DL/localstore/localstore.dart';

class InterestContr extends GetxController {
  var interestName = ''.obs;

  Future interestNameSet(String value) async {
    interestName.value = value;

    interestStore2 = LocalStore('interest: ' + interestName.value);
    await interestStore2.init();
  }

  //-----------------------------------------------------------------init/load
  Map interestMap = {};
  Future interestLoad() async {
    logParagraphStart('interestLoad');

    interestMap = await getSheetinterest();

    await interestContr.getFilelist();
    interestSet();
  }

  Future interestSet() async {
    plutogridContr.multilineDetailLayuout.value = '';

    logParagraphStart('interestSet');
    logi('interestSet(', '', 'interestName',
        interestMap['interestFilelistSheetName']);

    await interestContr
        .interestNameSet(interestMap['interestFilelistSheetName']);

    appHome.updateMap('interestMap', interestMap);
  }

  Future<Map> getSheetinterest() async {
    String interestFilelistUrl = '';
    String interestFilelistSheetName = '';
    if (!dlGlobals.domain.toString().contains('vercel.app')) {
      interestFilelistUrl = await loadAssetString('interestFilelistUrl');
      interestFilelistSheetName =
          await loadAssetString('interestFilelistSheetName');
    } else {
      interestFilelistUrl = remoteConfig.getString('interestFilelistUrl');
      interestFilelistSheetName =
          remoteConfig.getString('interestFilelistSheetName');
    }

    String interestFilelistFileId = bl.blUti.url2fileid(interestFilelistUrl);

    Map interestMap = {};
    interestMap['interestFilelistFileId'] = interestFilelistFileId;
    interestMap['interestFilelistSheetName'] = interestFilelistSheetName;

    return interestMap;
  }

  //----------------------------------------------------------intertest FileList

  late List<dynamic> fileListSheet = [];

  Future<String> getFilelist() async {
    logParagraphStart('getFilelist');
    String fileId = interestMap['interestFilelistFileId'];
    String sheetName = interestMap['interestFilelistSheetName'];
    if (await filelistDb.rowsCount(fileId, sheetName) == 0) {
      await dlGlobals.getSheetsService
          .getSheetAllRows(fileId, sheetName, false, 'filelistDb');
    }

    List<FileList?> filelistRows =
        await filelistDb.readRowsSheet(fileId, sheetName);
    fileListSheet.clear();
    for (var i = 1; i < filelistRows.length; i++) {
      fileListSheet.add(jsonDecode(filelistRows[i]!.row));
    }
    return 'ok';
  }

  String cardType = '';
  RxString fetshingRows = ''.obs;
  final String rowsCount = '10';
}

//---------------------------------------------------------------------filelist
Future getSheetsOfFilelist(List<dynamic> fileListSheet) async {
  for (var i = 0; i < fileListSheet.length; i++) {
    String fileId = bl.blUti.url2fileid(fileListSheet[i]['fileUrl']);
    String sheetName = fileListSheet[i]['sheetName'];

    int rowsCount = await sheetRowsDb.rowsCount(fileId, sheetName);
    if (rowsCount > 1) continue;
    try {
      await dlGlobals.getSheetsService
          .getSheetAllRows(fileId, sheetName, true, 'sheetRowsDb');
    } catch (_) {}
  }
}
