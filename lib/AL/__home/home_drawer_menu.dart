import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheetviewer/AL/__home/interests/interests_al.dart';
import 'package:sheetviewer/AL/alayouts/filelistpage/filelistviewpage.dart';

import 'package:sheetviewer/BL/bl.dart';

import 'settings.dart';
import 'about.dart';

Drawer homeDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.lightBlue,
            ),
            child: Column(
              children: [
                const Text('Selected interest'),
                ElevatedButton(
                    child: Obx(() => Text(interestContr.interestName.value)),
                    onPressed: () async {
                      await selectInterestManualy(context);
                    })
              ],
            )),
        ListTile(
          leading: const Icon(Icons.last_page),
          title: const Text('lastRows'),
          onTap: () async {
            interestContr.cardType = 'lastRows';
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => FilelistviewPage(interestContr.cardType),
                ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.first_page),
          title: const Text('firstRows'),
          onTap: () async {
            interestContr.cardType = 'firstRows';
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => FilelistviewPage(interestContr.cardType),
                ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.table_rows),
          title: const Text('allRows'),
          onTap: () async {
            interestContr.cardType = 'allRows';
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => FilelistviewPage(interestContr.cardType),
                ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.pages),
          title: const Text('From to rows'),
          onTap: () async {
            interestContr.cardType = 'From to rows';
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => FilelistviewPage(interestContr.cardType),
                ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.search),
          title: const Text('search word'),
          onTap: () async {
            interestContr.cardType = 'search word';
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => FilelistviewPage(interestContr.cardType),
                ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.tag),
          title: const Text('tags'),
          onTap: () async {
            interestContr.cardType = 'tags';
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => FilelistviewPage(interestContr.cardType),
                ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.filter_alt),
          title: const Text('Select1'),
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
