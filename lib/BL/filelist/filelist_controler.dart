import 'dart:convert';

import 'package:get/get.dart';

import 'package:sheetviewer/DL/dlglobals.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/BL/isardb/filelist.dart';
import 'package:sheetviewer/DL/loader/adapters/_common_adapters.dart';

class FilelistContr extends GetxController {
  var filelistName = ''.obs;
  var searchWordInAllSheets = ''.obs;

  var loadedSheetName = ''.obs;

  List<dynamic> filelist = [];

  RxString fetshingRows = ''.obs;

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
      List<List<dynamic>> rawRows =
          await dlGlobals.csvAdapter.getFilelistDynamic();
      await rawrows2dbFilelist(rawRows, 'local.csv');
    } else {
      List<List<dynamic>> rawRows = await dlGlobals.gSheetsAdapter
          .getFilelistDynamic(
              appConfigDb.filelistFileId, appConfigDb.filelistSheetName);
      await rawrows2dbFilelist(rawRows, 'remote.gsheet');
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
}
