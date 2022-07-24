import 'dart:convert';

import 'package:get/get.dart';

import 'package:sheetviewer/DL/dlglobals.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/BL/isardb/filelist.dart';

class FilelistContr extends GetxController {
  var interestName = ''.obs;
  var searchWordInAllSheets = ''.obs;

  var loadedSheetName = ''.obs;
  Future interestNameSet(String value) async {
    interestName.value = value;
  }

  //-----------------------------------------------------------------init/load
  Map interestMap = {};

  Future<String> filelistLoad() async {
    logParagraphStart('filelistLoad');

    interestMap = await getFilelistMap();

    await interestContr.getFilelist();

    return 'OK';
  }

  Future<Map> getFilelistMap() async {
    String filelistUrl = '';
    String filelistSheetName = '';
    String loadAdapter = '';
    Map dlSettings =
        await jsonDecode(await loadAssetJson('space/app_settings.json'));

    if (!dlGlobals.domain.toString().contains('vercel.app')) {
      filelistUrl = dlSettings["filelistUrl"];
      filelistSheetName = dlSettings['filelistSheetName'];
      loadAdapter = dlSettings['loadAdapter'];
    } else {
      filelistUrl = remoteConfig.getString('interestFilelistUrl');
      filelistSheetName = remoteConfig.getString('filelistSheetName');
      loadAdapter = '';
    }

    Map interestMap = {};
    interestMap['filelistFileId'] = bl.blUti.url2fileid(filelistUrl);
    interestMap['filelistSheetName'] = filelistSheetName;
    interestMap['loadAdapter'] = loadAdapter;
    logi('InterestContr', 'getInterestMap(', 'interestMap',
        interestMap.toString());

    appHome.updateMap('interestMap', interestMap);
    await interestContr.interestNameSet(interestMap['filelistSheetName']);
    interestContr.interestName.value = interestMap['filelistSheetName'];
    return interestMap;
  }

  //----------------------------------------------------------intertest FileList

  List<dynamic> interestFilelist = [];
  Map rowsCountListClient = {};
  Map rowsCountListGDrive = {};

  Future<String> getFilelist() async {
    logParagraphStart('getFilelist');
    String fileListFileId = interestMap['filelistFileId'];
    String fileListSheetName = interestMap['filelistSheetName'];

    Future fileListFill() async {
      if (dlGlobals.domain.toString().contains('vercel.app')) {
        await dlGlobals.gSheetsAdapter.getSheetAllRowsOld(
            fileListFileId, fileListSheetName, false, 'filelistDb');
      } else {
        if (interestMap['loadAdapter'].toString().startsWith('csv.')) {
          await dlGlobals.csvAdapter
              .getFilelist(fileListFileId, fileListSheetName);
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
    logParagraphStart('sheetRowsFill');
    for (var i = 1; i < filelistRows.length; i++) {
      Map fileRow = jsonDecode(filelistRows[i]!.row);
      String fileId = bl.blUti.url2fileid(fileRow['fileUrl']);
      String sheetName = fileRow['sheetName'];

      int rowsCount = await sheetRowsDb.rowsCount(fileId, sheetName);
      if (rowsCount == 0) {
        interestContr.loadedSheetName.value += '\n' + sheetName;
        if (interestMap['loadAdapter'].toString().startsWith('csv.')) {
          //dataSheet
          String fileLocal = bl.blUti.url2fileid(fileRow['fileLocal']);
          await dlGlobals.csvAdapter
              .getSheetAllrows(fileId, sheetName, fileLocal);

          //viewConfig?
          await dlGlobals.csvAdapter.getViewConfigLocalCsv(
              fileId, sheetName, fileRow['viewConfig.local']);
        } else {
          await dlGlobals.gSheetsAdapter
              .getViewConfigGapps(fileId, sheetName, fileRow['viewConfig']);
        }
      }

      interestFilelist.add(fileRow);
    }
  }
}
