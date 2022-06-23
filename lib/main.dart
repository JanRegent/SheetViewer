import 'package:flutter/material.dart';
import 'package:sheetviewer/DL/dlglobals.dart';

import 'AL/__home/homepage.dart';

import 'BL/bl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bl.init();

  await interestContr.interestsLoad();

  // String cell = await gsheetTest();
  // print(cell);
  await dlGlobals.getSheetsService
      .getAllRows('1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA', 'elonX');

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeApp(),
  ));
}
