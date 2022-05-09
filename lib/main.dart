import 'package:flutter/material.dart';
import 'AL/_sidebar/sidebar.dart';
import 'package:sheetviewer/DL/models/zsheetconfig.dart';

import 'AL/interests/controlers_interests.dart';
import 'BL/bl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bl.init();
  await logOn();
  await getDataInterests();
  //runApp(const GetDataInterestsApp());
  runApp(SidebarXExampleApp());
}
