import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/alayouts/filelistpage/filelistviewpage.dart';

import 'package:sheetviewer/BL/bl.dart';

import 'profile.dart';
import 'settings.dart';
import 'about.dart';

//
final List<Map> menu = [
  {
    'page': const FilelistviewPage('lastRows'),
    'title': 'Last rows',
    'icon': Icons.last_page
  },
  {
    'page': const FilelistviewPage('firstRows'),
    'title': 'First rows',
    'icon': Icons.first_page
  },
  {
    'page': const FilelistviewPage('allRows'),
    'title': 'All rows',
    'icon': Icons.table_rows
  },
  {'page': const Profile(), 'title': 'By values', 'icon': Icons.dashboard},
  {'page': const Settings(), 'title': 'By tags', 'icon': Icons.tag},
  {'page': const About(), 'title': 'Select1', 'icon': Icons.filter_alt}
];

List<Widget> menuWidgets = [];
void buildMenu(BuildContext context) {
  for (var i = 0; i < menu.length; i++) {
    menuWidgets.add(ListTile(
      leading: Icon(menu[i]['icon']),
      title: Text(menu[i]['title'].toString()),
      onTap: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => menu[i]['page'],
            ));
      },
      minVerticalPadding: 20.0,
    ));
    menuWidgets.add(Container(
      width: double.infinity,
      height: 2, // Thickness
      color: Colors.blue,
    ));
  }
}

Drawer homeDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('??')),
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
