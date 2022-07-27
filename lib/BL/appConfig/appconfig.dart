import 'dart:convert';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/log.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

Future appConfigLoad() async {
  String loadAdapter = '';
  logParagraphStart('appConfigLoad');

  Map appConfigJson = {};

  Future loadAdapterLoad() async {
    await queryParsGet();

    if (dlGlobals.domain.toString().contains('vercel.app')) {
      await appConfigDb.update('loadAdapter', 'remote.gsheet-vercel');
      return;
    }
    String localConfig = '';
    try {
      try {
        localConfig = await loadAssetJson('appConfig.json');
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
    await appConfigDb.update('loadAdapter', loadAdapter);
  }

  Future localLoad() async {
    if (dlGlobals.domain.toString().contains('vercel.app')) return;
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
    String remotelConfig = '';

    if (dlGlobals.domain.toString().contains('vercel.app')) {
      remotelConfig = remoteConfig.getString('appConfig_remote');
    } else {
      remotelConfig = await loadAssetJson('appConfig-remote.json');
    }
    String appConfigUrl = jsonDecode(remotelConfig)['appConfigUrl'];
    await appConfigDb.update('appConfigUrl', appConfigUrl);

    await appConfigDb.update('filelistFileId',
        bl.blUti.url2fileid(await appConfigDb.readByKey('appConfigUrl')));
    appConfigDb.filelistFileId = await appConfigDb.readByKey('filelistFileId');

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

  await appConfigDb.clear();
  await loadAdapterLoad();

  if (loadAdapter.startsWith('local')) {
    await localLoad();
    return;
  }

  await remoteLoad();
}

Future queryParsGet() async {
  var uri = Uri.dataFromString(window.location.href); //converts string to a uri
  Map<String, String> params =
      uri.queryParameters; // query parameters automatically populated

  String? sheetNameQueryPar = params['sheetName'];

  sheetNameQueryPar ??= const String.fromEnvironment("sheetName");
  appConfigDb.autoview1SheetName = sheetNameQueryPar;
  await appConfigDb.update('autoview1SheetName', sheetNameQueryPar);
}
