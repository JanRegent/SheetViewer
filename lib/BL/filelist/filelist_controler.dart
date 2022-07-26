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

    await filelistDb.clear();
    await sheetRowsDb.clear();

    await filelistRawLoad();

    filelist = await getFileListDynamic();
    return 'OK';
  }

  //----------------------------------------------------------intertest FileList

  Future filelistRawLoad() async {
    String loadAdapter = await appConfigDb.readByKey('loadAdapter');
    if ((loadAdapter.startsWith('local.csv'))) {
      await dlGlobals.csvAdapter.getFilelistDynamic();
    } else {
      await dlGlobals.gSheetsAdapter.getFileListUpdate(
          appConfigDb.filelistFileId, appConfigDb.filelistSheetName);
    }
  }

  Future<List<dynamic>> getFileListDynamic() async {
    List<dynamic> fileList = [];
    List<FileList?> list = await filelistDb.readRowsAllSheets();
    for (var i = 1; i < list.length; i++) {
      fileList.add(jsonDecode(list[i]!.row));
    }
    return fileList;
  }

  List<dynamic> filelist = [];
  Map rowsCountListClient = {};
  Map rowsCountListGDrive = {};

  RxString fetshingRows = ''.obs;
  final String rowsCount = '10';

  Future sheetRowsFill(String filelistFileId, String filelistSheetname) async {
    filelist.clear();
    List<FileList?> filelistRows =
        await filelistDb.readRowsSheet(filelistSheetname);
    logParagraphStart('sheetRowsFill');

    for (var i = 1; i < filelistRows.length; i++) {
      try {
        Map fileRow = jsonDecode(filelistRows[i]!.row);
        String fileId = bl.blUti.url2fileid(fileRow['fileUrl']);
        String sheetName = fileRow['sheetName'];

        filelistContr.loadedSheetName.value += '\n' + sheetName;

        int rowsCount = await sheetRowsDb.rowsCount(fileId, sheetName);
        //String loadAdapter = await appConfigDb.readByKey('loadAdapter');
        if (rowsCount == 0) {
          await dlGlobals.gSheetsAdapter.getSheetAllRows(fileId, sheetName);
          try {
            await dlGlobals.gSheetsAdapter
                .getViewConfigGapps(fileId, sheetName, fileRow['viewConfig']);
          } catch (_) {}
        }

        filelist.add(fileRow);
      } catch (_) {}
    }
  }
}
