import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/alayouts/filelistpage/filelistviewpage.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

//import 'menu.dart';
import 'interests/_interests/select_interest_dialog.dart';
import 'interests/interests_controlers.dart';
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
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: ElevatedButton(
              child: const Text('Select interest'),
              onPressed: () async {
                await selectInterest(context);
              }),
        ),
        ListTile(
          title: const Text('Profile'),
          onTap: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const Profile(),
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
