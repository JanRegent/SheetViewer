import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/elementsLib/alib.dart';

import 'settings.dart';
import 'about.dart';

Drawer homeDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        al.helpIcon(context),
        const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 169, 213, 234),
            ),
            child: Text('?')),
        ListTile(
          title: const Text('Settings'),
          onTap: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const Settings(),
                ));
          },
        ),
        ListTile(
          title: const Text('About'),
          onTap: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const About(),
                ));
          },
        ),
      ],
    ),
  );
}
