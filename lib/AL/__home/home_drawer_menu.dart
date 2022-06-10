import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/elementsLib/alib.dart';
import 'package:sheetviewer/AL/elementsLib/infodialogs/snack.dart';

import 'package:sheetviewer/BL/bl.dart';

import 'settings.dart';
import 'about.dart';

Drawer homeDrawer(BuildContext context) {
  ListView interestsListView() {
    return ListView.separated(
        separatorBuilder: (context, index) => const Divider(
              color: Color.fromARGB(255, 0, 11, 10),
              thickness: 1.0,
            ),
        itemCount: interestContr.titles.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(interestContr.titles[index],
                  style: interestContr.titles[index] ==
                          interestContr.interestName.value
                      ? const TextStyle(fontWeight: FontWeight.bold)
                      : null),
              onTap: () async {
                infoSnack(context,
                    'Loading interst:  ' + interestContr.titles[index]);

                await interestContr.interestSet(index);
                Navigator.pop(context);
              },
            ));
  }

  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        al.helpIcon(context),
        DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 169, 213, 234),
            ),
            child: interestsListView()),
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
