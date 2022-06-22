import 'package:flutter/material.dart';
import 'package:sheetviewer/DL/loader/contentservice.dart';

import 'AL/__home/homepage.dart';

import 'BL/bl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bl.init();

  await interestContr.interestsLoad();

  String cell = await gsheetTest();
  print(cell);

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeApp(),
  ));
}
