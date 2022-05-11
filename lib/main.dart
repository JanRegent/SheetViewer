import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/__home/interests/interests_controlers.dart';
import 'AL/__home/homepage2.dart';

import 'BL/bl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bl.init();

  await getDataInterests();

  runApp(const MaterialApp(
    home: HomeApp(),
  ));
}
