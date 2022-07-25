import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/__home/_home_filelist/_filelistviewhome.dart';

import 'BL/bl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bl.init();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const FilelistviewHomePage(),
    scrollBehavior: MyCustomScrollBehavior(),
  ));
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
