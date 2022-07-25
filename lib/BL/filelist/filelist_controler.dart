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

  Future<String> filelistLoad() async {
    logParagraphStart('filelistLoad');

    await filelistContr.getFilelist();

    return 'OK';
  }

  //----------------------------------------------------------intertest FileList

  List<dynamic> filelist = [];
  Map rowsCountListClient = {};
  Map rowsCountListGDrive = {};

  Future<String> getFilelist() async {
    logParagraphStart('getFilelist');

    Future fileListFill() async {
      String loadAdapter = await appConfigDb.readByKey('loadAdapter');
      if ((loadAdapter.startsWith('local.csv')) &&
          (!dlGlobals.domain.toString().contains('vercel.app'))) {
        await dlGlobals.csvAdapter.getFilelist(
            appConfigDb.filelistFileId, appConfigDb.filelistSheetName);
      } else {
        await dlGlobals.gSheetsAdapter.getFileListUpdate(
            appConfigDb.filelistFileId, appConfigDb.filelistSheetName);
      }
    }

    await fileListFill();

    await sheetRowsFill(
        appConfigDb.filelistFileId, appConfigDb.filelistSheetName);
    return 'ok';
  }

  RxString fetshingRows = ''.obs;
  final String rowsCount = '10';

  Future sheetRowsFill(String filelistFileId, String filelistSheetname) async {
    filelist.clear();
    List<FileList?> filelistRows =
        await filelistDb.readRowsSheet(filelistSheetname);
    logParagraphStart('sheetRowsFill');

    Future viaCsv(Map fileRow, String fileId, String sheetName) async {
      //dataSheet
      String filePath = 'config/filelists/' +
          dlGlobals.filelistDir +
          '/local.csv/' +
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
        print(fileId + ' ' + sheetName);
        filelistContr.loadedSheetName.value += '\n' + sheetName;

        int rowsCount = await sheetRowsDb.rowsCount(fileId, sheetName);
        String loadAdapter = await appConfigDb.readByKey('loadAdapter');
        if (rowsCount == 0) {
          if (loadAdapter.startsWith('local.csv')) {
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
