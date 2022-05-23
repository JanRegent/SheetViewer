import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sheetviewer/BL/bl.dart';

import 'home_drawer_menu.dart';

// ignore: must_be_immutable
class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Obx(() => Text(interestContr.interestName.value))),
        drawer: homeDrawer(context),
        body: const Text('News'));
  }
}