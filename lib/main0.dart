import 'package:flutter/material.dart';
import 'AL/__home/homepage2.dart';

import 'package:sheetviewer/DL/models/zsheetconfig.dart';

import 'AL/interests/interests_controlers.dart';
import 'BL/bl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bl.init();
  await logOn();
  await getDataInterests();
  //runApp(const GetDataInterestsApp());
  //runApp(const SidebarXExampleApp());

  runApp(const MaterialApp(
    home: HomeApp(),
  ));
}
