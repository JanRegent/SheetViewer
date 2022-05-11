import 'package:flutter/material.dart';
import 'AL/__home/homepage2.dart';

import 'AL/interests/interests_controlers.dart';
import 'BL/bl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bl.init();

  await getDataInterests();

  runApp(const MaterialApp(
    home: HomeApp(),
  ));
}
