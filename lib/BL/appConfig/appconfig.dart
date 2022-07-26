import 'dart:convert';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

Future appConfigLoad() async {
  String loadAdapter = '';
  logParagraphStart('appConfigLoad');

  Map appConfigJson = {};

  Future localLoad() async {
    String localConfig = '';
    try {
      try {
        localConfig = await loadAssetJson('appConfig-local.json');
      } catch (_) {
        localConfig = '';
      }
      if (localConfig.isEmpty) {
        return;
      }
    } catch (_) {}
    try {
      appConfigJson = jsonDecode(localConfig);
      loadAdapter = appConfigJson['loadAdapter'];
    } catch (_) {
      loadAdapter = '';
    }
    appConfigJson = jsonDecode(localConfig);
    if (!loadAdapter.startsWith('local')) return;

    dlGlobals.filelistDir = appConfigJson['filelistDir'];
    await appConfigDb.update('filelistDir', dlGlobals.filelistDir);
    await appConfigDb.update('filelistSheetName', dlGlobals.filelistDir);
    appConfigDb.filelistSheetName =
        await appConfigDb.readByKey('filelistSheetName');
  }

  Future remoteLoad() async {
    String localConfig = await loadAssetJson('appConfig-remote.json');
    appConfigJson = jsonDecode(localConfig);
    await appConfigDb.update('appConfigUrl', appConfigJson['appConfigUrl']);
    await appConfigDb.update('loadAdapter', appConfigJson['loadAdapter']);

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

  try {
    await localLoad();
  } catch (_) {}
  logi('local loadAdapter?', loadAdapter, '', '');

  if (loadAdapter.isEmpty) {
    await remoteLoad();
  }
  logi('remote loadAdapter?', loadAdapter, '', '');
  appConfigDb.update('loadAdapter', loadAdapter);
}
