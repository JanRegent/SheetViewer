// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/sheet/datasheet.dart';
import 'package:sheetviewer/BL/sheet/filelistsheet.dart';
import 'package:sheetviewer/DL/loader/tablist_filelist.dart';

import 'filelistviewPage.dart';

class TabsListsPage extends StatefulWidget {
  const TabsListsPage({Key? key}) : super(key: key);

  @override
  _TabsListsPageState createState() => _TabsListsPageState();
}

TabsListSheet tabsListSheet = TabsListSheet()
  ..tabslistTitle = 'Pro hledace 04tabs';

DataSheet apiSheet = DataSheet();

class _TabsListsPageState extends State<TabsListsPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<String> getData() async {
    String response = await getTabsList();
    tabsListSheet = TabsListSheet.fromJson(response);

    return 'ok';
  }

  DefaultTabController tabs() {
    List<Tab> tabsList = [];
    List<FilelistviewPage> tabsPages = [];
    for (var i = 0; i < tabsListSheet.rows.length; i++) {
      tabsList.add(Tab(
        text: tabsListSheet.rows[i]['tabName'],
      ));
      tabsPages.add(FilelistviewPage(
          tabsListSheet.rows[i]['url'], tabsListSheet.rows[i]['sheetName']));
    }
    return DefaultTabController(
      length: tabsListSheet.rows.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: tabsList,
          ),
          title: const Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: tabsPages,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: FutureBuilder<String>(
          future: getData(), // async work
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                  children: const [
                    Text('Loading tabs....'),
                    CircularProgressIndicator()
                  ],
                );

              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return tabs();
                }
            }
          },
        )

            //Center(child: filelistGrid()),
            ));
  }
}
