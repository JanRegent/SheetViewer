import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:sheetviewer/DL/models/sheet_config.dart';
import 'package:sheetviewer/DL/models/sheet.dart';

import 'AL/__home/tablist_home/1tabslistpage.dart';

import 'BL/bl.dart';

//import 'maintest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isar = await Isar.open(
    schemas: [SheetSchema, SheetConfigSchema],
    //directory: dir.path,
    inspector: false, // if you want to enable the inspector for debug builds
  );
  sheetsDb = SheetsDb(isar);
  await sheetsDb.init();
  sheetConfigDb = SheetConfigDb(isar);
  await sheetConfigDb.init();
  await GetStorage.init();
  await bl.init();
  await logOn();
  // await getSheetConfig(
  //     '1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw', 'dailyNotes__config__');

  // await getSheetConfig(
  //     '1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw', 'dailyNotes');

  String key = SheetConfig()
      .getKey('dailyNotes', '1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw');
  SheetConfig? sheetConfig = await sheetConfigDb.readSheetByIndex(key);

  if (sheetConfig.id > 0) {
    if (kDebugMode) {
      print(sheetConfig.id);
      print(sheetConfig.byValueColumns);
      //print(sheetConfig.toString());
    }
    sheetConfig.byValueColumns.add(DateTime.now().toIso8601String());
    await sheetConfigDb.updateConfig3(sheetConfig, 1647625753322);
    if (kDebugMode) {
      print(sheetConfig.byValueColumns);
      print(await sheetConfigDb.readIds());
      //print(sheetConfig.toString());
    }
  }
  if (kDebugMode) {
    print(await sheetConfigDb.readIds());
    //print(sheetConfig.toString());
  }
  runApp(const TabsListsPage());
}

Future<String> post0(String fileId, String sheetName, String column,
    String operator, String value) async {
  var client = http.Client();
  try {
    var response = await client.post(
        Uri.https('script.google.com',
            'macros/s/AKfycbzFVSOAxR2W8NZ1Ptu-qYnZNB6Xv-VdYG-jkZOMbXz4-FBtiO6nZbHtNcI_-Wa00mlU/exec'),
        body: {
          'name': DateTime.now().toIso8601String(),
          'fileId': fileId,
          'sheetName': sheetName,
          'column': column,
          'operator': operator,
          'value': value,
        });
    return response.body;
  } finally {
    client.close();
  }
}
