import 'package:flutter/material.dart';

//import 'menu.dart';
import 'profile.dart';
import 'settings.dart';
import 'about.dart';

final List<Map> menu = [
  {'page': 'byRowsPage', 'title': 'By rows', 'icon': Icons.table_rows},
  {'page': 'byValues', 'title': 'By values', 'icon': Icons.dashboard},
  {'page': 'byTags', 'title': 'By tags', 'icon': Icons.tag},
  {'page': 'Select1', 'title': 'Select1', 'icon': Icons.filter_alt}
];

// ignore: must_be_immutable
class HomeApp extends StatelessWidget {
  HomeApp({Key? key}) : super(key: key);

  List<Widget> menuWidgets = [];
  void buildMenu(BuildContext context) {
    for (var i = 0; i < menu.length; i++) {
      menuWidgets.add(Padding(
          padding: const EdgeInsets.all(20.0),
          child: MaterialButton(
            height: 100.0,
            minWidth: 150.0,
            color: i.isEven ? Colors.teal[100] : Colors.teal[200],
            textColor: Colors.black,
            child: Text(menu[i]['title'].toString()),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              )
            },
            splashColor: Colors.redAccent,
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    buildMenu(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("DashBoard"),
        ),
        drawer: Drawer(
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
            children: menuWidgets

            // <Widget>[
            //   Container(
            //     padding: const EdgeInsets.all(8),
            //     child: const Text("He'd have you all unravel at the"),
            //     color: Colors.teal[100],
            //   ),
            //   Container(
            //     padding: const EdgeInsets.all(8),
            //     child: const Text('Heed not the rabble'),
            //     color: Colors.teal[200],
            //   ),
            //   Container(
            //     padding: const EdgeInsets.all(8),
            //     child: const Text('Sound of screams but the'),
            //     color: Colors.teal[300],
            //   ),
            //   Container(
            //     padding: const EdgeInsets.all(8),
            //     child: const Text('Who scream'),
            //     color: Colors.teal[400],
            //   ),
            //   Container(
            //     padding: const EdgeInsets.all(8),
            //     child: const Text('Revolution is coming...'),
            //     color: Colors.teal[500],
            //   ),
            //   Container(
            //     padding: const EdgeInsets.all(8),
            //     child: const Text('Revolution, they...'),
            //     color: Colors.teal[600],
            //   ),
            // ],
            )

        // Center(
        //     child: Column(
        //   children: <Widget>[
        //     Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: menuWidgets),
        //   ],
        // )),
        );
  }
}
