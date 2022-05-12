import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './interests/interests_controlers.dart';

import 'home_drawer_menu.dart';

// ignore: must_be_immutable
class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buildMenu(context);
    return Scaffold(
        appBar: AppBar(
          title: ElevatedButton(
              child: Obx(() => Text(interestController.interestNameGet())),
              onPressed: () async {
                await selectInterest(context);
              }),
        ),
        drawer: homeDrawer(context),
        body: ListView(
            primary: false,
            padding: const EdgeInsets.all(20),
            children: menuWidgets));
  }
}
