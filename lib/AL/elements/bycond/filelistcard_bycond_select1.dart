import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';

import 'filelistcard_bycond_selects1runpane.dart';

class ByCondSelect1 extends StatelessWidget {
  final Map selec1tRow;

  const ByCondSelect1(this.selec1tRow, {Key? key}) : super(key: key);

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
          body: TabBarView(
            children: [
              ByCondSelect1runPane(selec1tRow),
              const Icon(Icons.add),
            ],
          ),
        ),
      ),
    );
  }
}
