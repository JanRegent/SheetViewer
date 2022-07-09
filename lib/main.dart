import 'package:flutter/material.dart';

import 'AL/__home/_homepage.dart';

import 'BL/bl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bl.init();

  await interestContr.interestLoad();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeApp(),
  ));
}
