import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/alayouts/filelistpage/filelistviewpage.dart';
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
              title: Text(interestContr.titles[index]),
              onTap: () async {
                infoSnack(context,
                    'Loading interst:  ' + interestContr.titles[index]);

                await interestContr.interestSet(index);
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
          leading: const Icon(Icons.table_rows),
          title: const Text('By rows'),
          onTap: () async {
            interestContr.cardType = 'byRows';
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => FilelistviewPage(interestContr.cardType),
                ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.search),
          title: const Text('By words                  By tags'),
          trailing: const Icon(Icons.tag),
          onTap: () async {
            interestContr.cardType = 'By words search';
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => FilelistviewPage(interestContr.cardType),
                ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.filter_alt),
          title: const Text('B y filters'),
          onTap: () async {
            interestContr.cardType = 'Select1';
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => FilelistviewPage(interestContr.cardType),
                ));
          },
        ),
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
