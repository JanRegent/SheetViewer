import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/__home/_filelistviewhome.dart';
import 'package:sheetviewer/DL/loader/adapters/pickfile.dart';
import 'BL/bl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bl.init();

  await interestContr.interestLoad();
  await csvRefresh();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FilelistviewHomePage('byRows'),
  ));
}
