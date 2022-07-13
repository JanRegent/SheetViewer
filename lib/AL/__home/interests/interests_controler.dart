import 'dart:convert';

import 'package:get/get.dart';

import 'package:sheetviewer/DL/dlglobals.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/DL/isardb/filelist.dart';

class InterestContr extends GetxController {
  var interestName = ''.obs;
  var loadedSheetName = ''.obs;
  Future interestNameSet(String value) async {
    interestName.value = value;
  }

  //-----------------------------------------------------------------init/load
  Map interestMap = {};

  Future<String> interestLoad() async {
    logParagraphStart('interestLoad');

    interestMap = await getInterestMap();
    interestContr.interestName.value = interestMap['interestFilelistSheetName'];

    await interestContr.getInterestFilelist();
    interestSet();

    // rowsCountListGDrive =
    //     await rowcountListPost(rowsCountListClient, interestMap);
    // logi('interestLoad', 'rowcountListPost', 'response.data',
    //     rowsCountListGDrive.toString());
    // if (kDebugMode) {
    //   print(rowsCountListGDrive);
    // }

    return 'OK';
  }

  Future interestSet() async {
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
    String fileListFileId = interestMap['interestFilelistFileId'];
    String fileListSheetName = interestMap['interestFilelistSheetName'];

    Future fileListFill() async {
      if (dlGlobals.domain.toString().contains('vercel.app')) {
        await dlGlobals.gSheetsAdapter.getSheetAllRowsOld(
            fileListFileId, fileListSheetName, false, 'filelistDb');
      } else {
        if (interestMap['loadAdapter'].toString().startsWith('csv.')) {
          await dlGlobals.csvAdapter
              .getInterestFilelist(fileListFileId, fileListSheetName);
        } else {
          await dlGlobals.gSheetsAdapter.getSheetAllRowsOld(
              fileListFileId, fileListSheetName, false, 'filelistDb');
        }
      }
    }

    if (await filelistDb.rowsCount(fileListFileId, fileListSheetName) == 0) {
      await fileListFill();
    }
    await sheetRowsFill(fileListFileId, fileListSheetName);
    return 'ok';
  }

  String cardType = '';
  RxString fetshingRows = ''.obs;
  final String rowsCount = '10';

  Future sheetRowsFill(String filelistFileId, String filelistSheetname) async {
    List<FileList?> filelistRows =
        await filelistDb.readRowsSheet(filelistFileId, filelistSheetname);
    interestFilelist.clear();

    for (var i = 1; i < filelistRows.length; i++) {
      Map fileRow = jsonDecode(filelistRows[i]!.row);
      String fileId = bl.blUti.url2fileid(fileRow['fileUrl']);
      String sheetName = fileRow['sheetName'];
      int rowsCount = await sheetRowsDb.rowsCount(fileId, sheetName);
      if (rowsCount == 0) {
        interestContr.loadedSheetName.value += '\n' + sheetName;
        if (interestMap['loadAdapter'].toString().startsWith('csv.')) {
          String fileLocal = bl.blUti.url2fileid(fileRow['fileLocal']);
          await dlGlobals.csvAdapter
              .getSheetAllrows(fileId, sheetName, fileLocal);
        } else {
          await dlGlobals.gSheetsAdapter.getSheetAllRows(fileId, sheetName);
        }
      }
      // Map updateRow = {};
      // updateRow['fileId'] = fileId;
      // updateRow['sheetName'] = sheetName;
      // updateRow['rowsCountClient'] = rowsCount;
      // rowsCountListClient[i.toString()] = updateRow;
      interestFilelist.add(fileRow);
    }
  }
}
