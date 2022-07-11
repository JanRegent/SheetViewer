import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/__home/_filelistviewhome.dart';
import 'package:sheetviewer/DL/loader/adapters/gdrive_sheetsviewbackkend.dart';

import 'BL/bl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bl.init();

  await interestContr.interestLoad();
  //await csvRefresh();
  await post1();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FilelistviewHomePage('byRows'),
  ));
}
