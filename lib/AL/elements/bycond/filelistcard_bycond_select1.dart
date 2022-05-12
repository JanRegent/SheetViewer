import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';
import 'package:sheetviewer/DL/isardb/sheetviewconfig.dart';

import 'filelistcard_bycond_selects1runpane.dart';

class ByCondSelect1 extends StatelessWidget {
  final SheetViewConfig sheetConfig;

  const ByCondSelect1(this.sheetConfig, {Key? key}) : super(key: key);

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
              ByCondSelect1runPane(sheetConfig),
              const Icon(Icons.add),
            ],
          ),
        ),
      ),
    );
  }
}
