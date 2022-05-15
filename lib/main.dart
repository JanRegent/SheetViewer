import 'package:flutter/material.dart';

import 'AL/__home/homepage2.dart';

import 'BL/bl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bl.init();

  await interestContr.interestsLoad();

  runApp(const MaterialApp(
    home: HomeApp(),
  ));
}
