import 'dart:convert';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

Future appConfigLoad() async {
  String loadAdapter = '';

  Future remoteLoad() async {
    if (dlGlobals.domain.toString().contains('vercel.app')) {
      String appConfigUrl = remoteConfig.getString('appConfigUrl');
      await appConfigDb.update('appConfigUrl', appConfigUrl);
    }
    await appConfigDb.update('appConfigFileId',
        bl.blUti.url2fileid(await appConfigDb.readByKey('appConfigUrl')));
    appConfigDb.filelistFileId = await appConfigDb.readByKey('appConfigFileId');

    List<List<String>> appConfigSheet = await dlGlobals.gSheetsAdapter
        .getSheetRawRows(appConfigDb.filelistFileId, 'appConfig');
    for (var i = 0; i < appConfigSheet.length; i++) {
      try {
        if (appConfigSheet[i][0].isEmpty) continue;
        if (appConfigSheet[i][0].startsWith('//')) continue;
        await appConfigDb.update(appConfigSheet[i][0], appConfigSheet[i][1]);
      } catch (_) {
        continue;
      }
    }
    appConfigDb.filelistSheetName =
        await appConfigDb.readByKey('filelistSheetName');
  }

  Map appConfigJson = {};
  Future localLoad() async {
    dlGlobals.filelistDir = appConfigJson['filelistDir'];
    await appConfigDb.update('filelistDir', dlGlobals.filelistDir);
    await appConfigDb.update('filelistSheetName', dlGlobals.filelistDir);
    appConfigDb.filelistSheetName =
        await appConfigDb.readByKey('filelistSheetName');
  }

  try {
    appConfigJson = jsonDecode(await loadAssetJson('appConfig.json'));
    loadAdapter = appConfigJson['loadAdapter'];
    if (loadAdapter.isNotEmpty) {
      await appConfigDb.update('loadAdapter', loadAdapter);
    }
  } catch (_) {}

  if (loadAdapter.isEmpty) {
    await remoteLoad();
  }
  if (loadAdapter.startsWith('local')) {
    await localLoad();
  }
}
