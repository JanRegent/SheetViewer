import 'dart:convert';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

Future appConfigLoad() async {
  Map map = jsonDecode(await loadAssetJson('appConfig.json'));
  bl.appConfig['appConfigUrl'] = map['appConfigUrl'];
  bl.appConfig['appConfiFileId'] =
      bl.blUti.url2fileid(bl.appConfig['appConfigUrl']);

  appConfigSheet = await dlGlobals.gSheetsAdapter
      .getSheetRawRows(bl.appConfig['appConfiFileId'], 'appConfig');
  for (var i = 0; i < appConfigSheet.length; i++) {
    try {
      if (appConfigSheet[i][0].isEmpty) continue;
      if (appConfigSheet[i][0].startsWith('//')) continue;
      bl.appConfig[appConfigSheet[i][0]] = appConfigSheet[i][1];
    } catch (_) {
      continue;
    }
  }
  bl.appConfig['filelistFileId'] = bl.appConfig['appConfiFileId'];
}

List<List<String>> appConfigSheet = [];
