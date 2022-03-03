import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:sheetviewer/BL/sheet/sheet_config.dart';
import 'package:sheetviewer/DL/models/sheets.dart';

import 'AL/__home/1tabslistpage.dart';
import 'BL/bl.dart';

import 'DL/loader/loader.dart';
//import 'maintest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isar = await Isar.open(
    schemas: [SheetsSchema, SheetConfigSchema],
    //directory: dir.path,
    inspector: false, // if you want to enable the inspector for debug builds
  );
  sheetsDb = SheetsDb(isar);
  sheetConfigDb = SheetConfigDb(isar);

  await GetStorage.init();
  await bl.init();
  await logOn();
  SheetConfig sheetConfig = await getSheetConfig(
      '1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw', 'dailyNotes');
  sheetConfigDb.updateConfig('dailyNotes', sheetConfig);
  // String resp = await post0('1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw',
  //     'dailyNotes', 'cesky', 'contains', 'laska');
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
