import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/__home/interests/_interests/interest_selection.dart';

import 'AL/__home/homepage2.dart';

import 'BL/bl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bl.init();

  await interestsLoad();

  runApp(const MaterialApp(
    home: HomeApp(),
  ));
}
