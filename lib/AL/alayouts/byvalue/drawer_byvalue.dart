import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';

Drawer byValueDrawer(BuildContext context, Function setStateFunc) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 169, 213, 234),
            ),
            child: ListTile(
              title: const Text('By value drawemenu'),
              trailing: al.helpIcon(context),
            )),
      ],
    ),
  );
}
