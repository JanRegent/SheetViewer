import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/interests/controlers_interests.dart';

import 'home_drawer.dart';

// ignore: must_be_immutable
class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buildMenu(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(interestRowCurrent['interestName']),
        ),
        drawer: homeDrawer(context),
        body: ListView(
            primary: false,
            padding: const EdgeInsets.all(20),
            children: menuWidgets));
  }
}
