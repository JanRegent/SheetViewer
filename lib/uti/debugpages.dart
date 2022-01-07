import 'package:flutter/material.dart';

import '../AL/alib/alib.dart';
import '../BL/bl.dart';
import 'viewers/json_viewer.dart';

class DebugPages extends StatelessWidget {
  const DebugPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.four_g_plus_mobiledata)),
                Tab(icon: Icon(Icons.format_align_justify_outlined)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text('Debug pages'),
            leading: al.iconBack(context),
          ),
          body: TabBarView(
            children: [
              blGlobalsListview(),
              JsonViewerPage(bl.dataSheet4debug.rawDataSheet),
              const Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

ListView blGlobalsListview() {
  List<Widget> myList = [];
  myList.add(ListTile(
    leading: const Text('contentServiceUrl'),
    title: Text(bl.blGlobal.contentServiceUrl),
    trailing: Text(bl.blGlobal.contentServiceUrlLastModified),
  ));
  return ListView.separated(
      itemCount: myList.length,
      // The list items
      itemBuilder: (context, index) {
        return myList[index];
      },
      // The separators
      separatorBuilder: (context, index) {
        return Divider(
          color: Theme.of(context).primaryColor,
        );
      });
}
