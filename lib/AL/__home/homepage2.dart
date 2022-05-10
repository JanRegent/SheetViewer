import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/interests/controlers_interests.dart';

//import 'menu.dart';
import 'profile.dart';
import 'settings.dart';
import 'about.dart';

final List<Map> menu = [
  {'page': About, 'title': 'By rows', 'icon': Icons.table_rows},
  {'page': Profile, 'title': 'By values', 'icon': Icons.dashboard},
  {'page': Settings, 'title': 'By tags', 'icon': Icons.tag},
  {'page': About, 'title': 'Select1', 'icon': Icons.filter_alt}
];

// ignore: must_be_immutable
class HomeApp extends StatelessWidget {
  HomeApp({Key? key}) : super(key: key);

  List<Widget> menuWidgets = [];
  void buildMenu(BuildContext context) {
    for (var i = 0; i < menu.length; i++) {
      menuWidgets.add(ListTile(
        leading: Icon(menu[i]['icon']),
        title: Text(menu[i]['title'].toString()),
        minVerticalPadding: 20.0,
      ));
      menuWidgets.add(Container(
        width: double.infinity,
        height: 2, // Thickness
        color: Colors.blue,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    buildMenu(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(interestRowCurrent['interestName']),
        ),
        drawer: Drawer(
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
                    onPressed: () {
                      debugPrint('select interest');
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
        ),
        body: ListView(
            primary: false,
            padding: const EdgeInsets.all(20),
            children: menuWidgets));
  }
}
