import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:sheetviewer/AL/views/plutogrid/drawer.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/DL/isardb/filelist.dart';

import 'package:sheetviewer/DL/loader/adapters/gdrive_sheetsviewbackkend.dart';

class InterestContr extends GetxController {
  var interestName = ''.obs;

  Future interestNameSet(String value) async {
    interestName.value = value;
  }

  //-----------------------------------------------------------------init/load
  Map interestMap = {};

  Future interestLoad() async {
    logParagraphStart('interestLoad');

    interestMap = await getInterestMap();

    await interestContr.getInterestFilelist();
    interestSet();

    rowsCountListGDrive = await rowcountListPost(rowsCountListClient);
    if (kDebugMode) {
      print(rowsCountListGDrive);
    }
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

  Future<Map> getInterestMap() async {
    String interestFilelistUrl = '';
    String interestFilelistSheetName = '';
    String loadAdapter = '';
    if (!dlGlobals.domain.toString().contains('vercel.app')) {
      interestFilelistUrl = await loadAssetString('interestFilelistUrl');
      interestFilelistSheetName =
          await loadAssetString('interestFilelistSheetName');
      loadAdapter = await loadAssetString('loadAdapter');
    } else {
      interestFilelistUrl = remoteConfig.getString('interestFilelistUrl');
      interestFilelistSheetName =
          remoteConfig.getString('interestFilelistSheetName');
      loadAdapter = '';
    }

    Map interestMap = {};
    interestMap['interestFilelistFileId'] =
        bl.blUti.url2fileid(interestFilelistUrl);
    interestMap['interestFilelistSheetName'] = interestFilelistSheetName;
    interestMap['loadAdapter'] = loadAdapter;
    logi('InterestContr', 'getInterestMap(', 'interestMap',
        interestMap.toString());
    return interestMap;
  }

  //----------------------------------------------------------intertest FileList

  List<dynamic> interestFilelist = [];
  Map rowsCountListClient = {};
  Map rowsCountListGDrive = {};

  Future<String> getInterestFilelist() async {
    logParagraphStart('getFilelist');
    String fileId = interestMap['interestFilelistFileId'];
    String sheetName = interestMap['interestFilelistSheetName'];

    if (interestMap['loadAdapter'].toString().startsWith('csv.')) {
      fileId = 'csv.local/interestFilelist';
      sheetName = 'interestFilelist';
    }

    if (await filelistDb.rowsCount(fileId, sheetName) == 0) {
      if (dlGlobals.domain.toString().contains('vercel.app')) {
        await dlGlobals.gSheetsAdapter
            .getSheetAllRows(fileId, sheetName, false, 'filelistDb');
      } else {
        if (interestMap['loadAdapter'].toString().startsWith('csv.')) {
          await dlGlobals.csvAdapter.getInterestFilelist(fileId, sheetName);
        } else {
          await dlGlobals.gSheetsAdapter
              .getSheetAllRows(fileId, sheetName, false, 'filelistDb');
        }
      }
    }

    List<FileList?> filelistRows =
        await filelistDb.readRowsSheet(fileId, sheetName);
    interestFilelist.clear();

    for (var i = 1; i < filelistRows.length; i++) {
      Map fileRow = jsonDecode(filelistRows[i]!.row);
      String fileId = bl.blUti.url2fileid(fileRow['fileUrl']);
      String sheetName = fileRow['sheetName'];
      int rowsCount = await sheetRowsDb.rowsCount(fileId, sheetName);
      Map updateRow = {};
      updateRow['fileId'] = fileId;
      updateRow['sheetName'] = sheetName;
      updateRow['rowsCountClient'] = rowsCount;
      rowsCountListClient[i.toString()] = updateRow;
      interestFilelist.add(fileRow);
    }

    return 'ok';
  }

  String cardType = '';
  RxString fetshingRows = ''.obs;
  final String rowsCount = '10';
}
