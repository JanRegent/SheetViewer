import 'dart:convert';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

Future localCsvLoad() async {
  if (dlGlobals.domain.toString().contains('vercel.app')) return;
  String localConfig = '';
  try {
    try {
      localConfig = await loadAssetJson('appConfig-local.csv.json');
    } catch (_) {
      localConfig = '';
    }
    if (localConfig.isEmpty) {
      return;
    }
  } catch (_) {}

  Map appConfigJson = {};
  try {
    appConfigJson = jsonDecode(localConfig);
  } catch (_) {}
  await appConfigDb.update(
      'filelistSheetName', appConfigJson['filelistSheetName']);
  appConfigDb.filelistSheetName =
      await appConfigDb.readByKey('filelistSheetName');
}
