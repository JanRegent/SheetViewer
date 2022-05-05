import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elements/_interests/getdatainterests.dart';
import 'package:sheetviewer/DL/models/zsheetconfig.dart';

import 'BL/bl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bl.init();
  await logOn();
  runApp(const GetDataInterestsApp());
}
