import 'dart:convert';

import 'package:get/get.dart';

import 'package:sheetviewer/DL/dlglobals.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/BL/isardb/filelist.dart';

class FilelistContr extends GetxController {
  var filelistName = ''.obs;
  var searchWordInAllSheets = ''.obs;

  var loadedSheetName = ''.obs;
  Future filelistNameSet(String value) async {
    filelistName.value = value;
  }

  //-----------------------------------------------------------------init/load
  Map filelistMap = {};

  Future<String> filelistLoad() async {
    logParagraphStart('filelistLoad');

    filelistMap = await getFilelistMap();

    await filelistContr.getFilelist();

    return 'OK';
  }

  Future<Map> getFilelistMap() async {
    String filelistUrl = '';
    String filelistSheetName = '';
    String loadAdapter = '';

    String filelistDirs_ = await loadAssetString('filelists/filelists2show');
    List<String> filelistDirs = filelistDirs_.split('\n');
    String configDir = 'filelists/${filelistDirs[0].trim()}/app_settings.json';
    appHome.updateMap('configDir', {'configDir': configDir});
    Map dlSettings = await jsonDecode(await loadAssetJson(configDir));

    if (!dlGlobals.domain.toString().contains('vercel.app')) {
      filelistUrl = dlSettings["filelistUrl"];
      filelistSheetName = dlSettings['filelistSheetName'];
      loadAdapter = dlSettings['loadAdapter'];
    } else {
      filelistUrl = remoteConfig.getString('interestFilelistUrl');
      filelistSheetName = remoteConfig.getString('filelistSheetName');
      loadAdapter = '';
    }

    Map filelistMap = {};
    filelistMap['filelistFileId'] = bl.blUti.url2fileid(filelistUrl);
    filelistMap['filelistSheetName'] = filelistSheetName;
    filelistMap['loadAdapter'] = loadAdapter;
    logi('filelistContr', 'getInterestMap(', 'filelistMap',
        filelistMap.toString());

    appHome.updateMap('filelistMap', filelistMap);
    await filelistContr.filelistNameSet(filelistMap['filelistSheetName']);
    filelistContr.filelistName.value = filelistMap['filelistSheetName'];
    return filelistMap;
  }

  //----------------------------------------------------------intertest FileList

  List<dynamic> filelist = [];
  Map rowsCountListClient = {};
  Map rowsCountListGDrive = {};

  Future<String> getFilelist() async {
    logParagraphStart('getFilelist');
    String fileListFileId = filelistMap['filelistFileId'];
    String fileListSheetName = filelistMap['filelistSheetName'];

    Future fileListFill() async {
      if (dlGlobals.domain.toString().contains('vercel.app')) {
        await dlGlobals.gSheetsAdapter.getSheetAllRowsOld(
            fileListFileId, fileListSheetName, false, 'filelistDb');
      } else {
        if (filelistMap['loadAdapter'].toString().startsWith('csv.')) {
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
    filelist.clear();
    logParagraphStart('sheetRowsFill');
    for (var i = 1; i < filelistRows.length; i++) {
      Map fileRow = jsonDecode(filelistRows[i]!.row);
      String fileId = bl.blUti.url2fileid(fileRow['fileUrl']);
      String sheetName = fileRow['sheetName'];

      int rowsCount = await sheetRowsDb.rowsCount(fileId, sheetName);
      if (rowsCount == 0) {
        filelistContr.loadedSheetName.value += '\n' + sheetName;
        if (filelistMap['loadAdapter'].toString().startsWith('csv.')) {
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

      filelist.add(fileRow);
    }
  }
}
