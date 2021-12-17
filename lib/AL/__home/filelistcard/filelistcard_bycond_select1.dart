import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/alib/alib.dart';

import 'filelistcard_bycond_selects1runpane.dart';

class ByCondSelect1 extends StatelessWidget {
  final String fileId;
  final String sheetName;

  const ByCondSelect1(this.fileId, this.sheetName, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: al.iconBack(context),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.list)),
                Tab(icon: Icon(Icons.add)),
              ],
            ),
            title: const Text('Selects1'),
          ),
          body: const TabBarView(
            children: [
              ByCondSelect1runPane(),
              Icon(Icons.add),
            ],
          ),
        ),
      ),
    );
  }
}
