import 'dart:convert';

import 'package:get/get.dart';
import 'package:sheetviewer/AL/views/plutogrid/drawer.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/DL/isardb/filelist.dart';

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
    }

    Map interestMap = {};
    interestMap['interestFilelistFileId'] =
        bl.blUti.url2fileid(interestFilelistUrl);
    interestMap['interestFilelistSheetName'] = interestFilelistSheetName;
    interestMap['loadAdapter'] = loadAdapter;

    return interestMap;
  }

  //----------------------------------------------------------intertest FileList

  late List<dynamic> interestFilelist = [];

  Future<String> getInterestFilelist() async {
    logParagraphStart('getFilelist');
    String fileId = interestMap['interestFilelistFileId'];
    String sheetName = interestMap['interestFilelistSheetName'];
    if (interestMap['loadAdapter'].toString().startsWith('csv.')) {
      fileId = 'csv.local/interestFilelist';
      sheetName = 'interestFilelist';
    }

    if (await filelistDb.rowsCount(fileId, sheetName) == 0) {
      if (interestMap['loadAdapter'].toString().startsWith('csv.')) {
        await dlGlobals.csvAdapter.getFilelist(fileId, 'interestFilelist');
      } else {
        await dlGlobals.gSheetsAdapter
            .getSheetAllRows(fileId, sheetName, false, 'filelistDb');
      }
    }

    List<FileList?> filelistRows =
        await filelistDb.readRowsSheet(fileId, sheetName);
    interestFilelist.clear();
    for (var i = 1; i < filelistRows.length; i++) {
      interestFilelist.add(jsonDecode(filelistRows[i]!.row));
    }

    return 'ok';
  }

  String cardType = '';
  RxString fetshingRows = ''.obs;
  final String rowsCount = '10';
}
