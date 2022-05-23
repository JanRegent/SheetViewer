import 'package:flutter/material.dart';

import 'AL/__home/homepage.dart';

import 'BL/bl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await getBaseUrl();

  await bl.init();

  await interestContr.interestsLoad();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeApp(),
  ));
}
