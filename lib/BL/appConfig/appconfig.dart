import 'dart:convert';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

Future appConfigLoad() async {
  if (dlGlobals.domain.toString().contains('vercel.app')) {
    String appConfigUrl = remoteConfig.getString('appConfigUrl');
    await appConfigDb.update('appConfigUrl', appConfigUrl);
  } else {
    Map map = jsonDecode(await loadAssetJson('appConfig.json'));
    await appConfigDb.update('appConfigUrl', map['appConfigUrl']);
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
