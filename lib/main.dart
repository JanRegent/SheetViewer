import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:sheetviewer/AL/elements/_interests/getdatainterests.dart';
//import 'package:sheetviewer/DL/loader/posts.dart';
import 'package:sheetviewer/DL/models/zsheetconfig.dart';
import 'package:sheetviewer/DL/models/sheetview.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

//import 'AL/__home/tablist_home/1tabslistpage.dart';

import 'BL/bl.dart';

//import 'maintest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isar = await Isar.open(
    schemas: [SheetViewSchema, SheetViewConfigSchema, SheetConfigSchema],
    //directory: dir.path,
    inspector: false, // if you want to enable the inspector for debug builds
  );

  sheetsDb = SheetsDb(isar);
  await sheetsDb.init();
  sheetViewConfigDb = SheetViewConfigDb(isar);
  sheetConfigDb = SheetConfigDb(isar);
  await sheetConfigDb.init();

  await bl.init();
  await logOn();
  //await post1();

  // await getSheetConfig(
  //     '1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw', 'dailyNotes__config__');

  // await getSheetConfig(
  //     '1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw', 'dailyNotes');

  // String sheetNameFileKey = SheetConfig()
  //     .getKey('dailyNotes', '1bVD2gBzQDAP_7lteXqr2Vpv7Em0qQkpoOhK1UlLtvOw');
  // int? id = await sheetConfigDb.getId(sheetNameFileKey);
  // print(id);

  // SheetConfig? sheetConfig =
  //     await sheetConfigDb.readSheetByIndex(sheetNameFileKey);

  // if (sheetConfig != null) {
  //   sheetConfig.byValueColumns = sheetConfig.byValueColumns +
  //       '__|__x1__' +
  //       DateTime.now().millisecond.toString();
  //   Future.delayed(const Duration(seconds: 1));
  //   sheetConfig.byValueColumns = sheetConfig.byValueColumns +
  //       '__|__x2__' +
  //       DateTime.now().millisecond.toString();
  //   Future.delayed(const Duration(seconds: 1));
  //   sheetConfig.byValueColumns = sheetConfig.byValueColumns +
  //       '__|__x3__' +
  //       DateTime.now().millisecond.toString();

  //   await sheetConfigDb.updateConfig(sheetConfig);
  //   if (kDebugMode) {
  //     print(sheetConfig.id);
  //   }
  // }
  if (kDebugMode) {
    //print(sheetConfig.toString());

  }
  //toastMain();
  runApp(const GetDataInterestsApp());
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
