// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sheetviewer/AL/__home/tablist_home/home_help.dart';
import 'package:sheetviewer/AL/pages/filelist/filelistviewpage.dart';
import 'package:sheetviewer/BL/datasheet/datasheet.dart';
import 'package:sheetviewer/DL/loader/getsheet.dart';

class TabsListsPage extends StatefulWidget {
  const TabsListsPage({Key? key}) : super(key: key);

  @override
  _TabsListsPageState createState() => _TabsListsPageState();
}

DataSheet apiSheet = DataSheet();

class _TabsListsPageState extends State<TabsListsPage> {
  @override
  void initState() {
    super.initState();
  }

  Map tabsListResponse = {};
  Future<String> getData() async {
    tabsListResponse = await getSheet(
        '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis', 'tabsList');
    return 'ok';
  }

  String interestTitle = 'Tabs Demo';

  DefaultTabController tabs(BuildContext context) {
    List<Tab> tabsList = [];
    List<FilelistviewPage> tabsPages = [];
    for (var i = 0; i < tabsListResponse['rows'].length; i++) {
      Map tabrow = tabsListResponse['rows'][i];
      tabsList.add(Tab(
        text: tabrow['tabName'],
      ));
      tabsPages.add(FilelistviewPage(tabrow['url'], tabrow['sheetName']));
    }

    return DefaultTabController(
      length: tabsListResponse['rows'].length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: tabsList,
          ),
          title: Text(interestTitle),
          actions: [
            ElevatedButton(
              child: const Icon(Icons.help),
              onPressed: () => helpToastShow(
                  "<-- Click on tab of interest", ToastGravity.TOP),
            ),
          ],
        ),
        body: TabBarView(
          children: tabsPages,
        ),
      ),
    );
  }

  Widget homeBuilder() {
    return FutureBuilder<String>(
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
              return tabs(context);
            }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: homeBuilder(),
        ));
  }
}