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

    String showList = await loadAssetString('filelists/showList');
    showList = showList.trim();
    dlGlobals.filelistDir = 'filelists/$showList/';
    appHome.updateMap('showList', {
      'filelistDir': dlGlobals.filelistDir,
      'app_settings': dlGlobals.filelistDir + 'app_settings.json'
    });
    Map dlSettings = await jsonDecode(
        await loadAssetJson(dlGlobals.filelistDir + 'app_settings.json'));

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

    await fileListFill();
    await sheetRowsFill(fileListFileId, fileListSheetName);
    return 'ok';
  }

  RxString fetshingRows = ''.obs;
  final String rowsCount = '10';

  Future sheetRowsFill(String filelistFileId, String filelistSheetname) async {
    List<FileList?> filelistRows =
        await filelistDb.readRowsSheet(filelistFileId, filelistSheetname);
    filelist.clear();
    logParagraphStart('sheetRowsFill');

    Future viaCsv(Map fileRow, String fileId, String sheetName) async {
      //dataSheet
      String filePath = 'config/' +
          dlGlobals.filelistDir +
          'csv.local/' +
          fileRow['fileLocal'];
      await dlGlobals.csvAdapter.getSheetAllrows(fileId, sheetName, filePath);

      //viewConfig?
      await dlGlobals.csvAdapter.getViewConfigLocalCsv(
          fileId, sheetName, fileRow['viewConfig.local']);
    }

    for (var i = 1; i < filelistRows.length; i++) {
      try {
        Map fileRow = jsonDecode(filelistRows[i]!.row);
        String fileId = bl.blUti.url2fileid(fileRow['fileUrl']);
        String sheetName = fileRow['sheetName'];
        filelistContr.loadedSheetName.value += '\n' + sheetName;

        int rowsCount = await sheetRowsDb.rowsCount(fileId, sheetName);
        if (rowsCount == 0) {
          if (filelistMap['loadAdapter'].toString().startsWith('csv.')) {
            await viaCsv(fileRow, fileId, sheetName);
          } else {
            await dlGlobals.gSheetsAdapter.getSheetAllRows(fileId, sheetName);
            try {
              await dlGlobals.gSheetsAdapter
                  .getViewConfigGapps(fileId, sheetName, fileRow['viewConfig']);
            } catch (_) {}
          }
        }

        filelist.add(fileRow);
      } catch (_) {}
    }
  }
}
