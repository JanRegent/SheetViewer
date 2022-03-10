import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/bl.dart';

Drawer tablistDrawer(Function setStateFunc) {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: const Text('lastGrid'),
          onTap: () {
            bl.tablistView = 'lastGrid';
            setStateFunc();
          },
        ),
        ListTile(
          title: const Text('All queries list'),
          onTap: () {
            bl.tablistView = 'allFileList';
            setStateFunc();
          },
        ),
      ],
    ),
  );
}
