import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/__home/_home_filelist/_filelistviewhome.dart';
import 'package:sheetviewer/AL/views/plutogrid/_gridpage.dart';

import 'AL/views/autoview1_gridview.dart';
import 'BL/bl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bl.init();

  if (appConfigDb.autoview1SheetName.isEmpty) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FilelistviewHomePage(),
      scrollBehavior: MyCustomScrollBehavior(),
    ));
  } else {
    await showGridAutoview1();
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridPage(sheetRows),
      scrollBehavior: MyCustomScrollBehavior(),
    ));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
