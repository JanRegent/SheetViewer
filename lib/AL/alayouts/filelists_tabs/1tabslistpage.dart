// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sheetviewer/AL/alayouts/filelists_tabs/home_help.dart';
import 'package:sheetviewer/AL/alayouts/filelist/filelistviewpage.dart';
import 'package:sheetviewer/AL/alayouts/lastgrid/lastgridpage.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';

import 'package:sheetviewer/BL/actionSheet/getsheet.dart';

class TabsListsPage extends StatefulWidget {
  final String layout;
  const TabsListsPage(this.layout, {Key? key}) : super(key: key);

  @override
  _TabsListsPageState createState() => _TabsListsPageState();
}

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

  Widget switchPage(String layout) {
    switch (layout) {
      case 'lastGrid':
        return tabs(context, 'lastGrid');
      case 'fileList':
        return tabs(context, 'fileList');
      default:
        return tabs(context, 'lastGrid');
    }
  }

  StatefulWidget tabs(BuildContext context, String layout) {
    List<Tab> tabsList = [];

    List<Widget> tabsPages = [];
    for (var i = 0; i < tabsListResponse['rows'].length; i++) {
      Map tabrow = tabsListResponse['rows'][i];
      tabsList.add(Tab(
        text: tabrow['tabName'],
      ));
      if (layout == 'lastGrid') {
        interestTitle = 'Last N rows';
        tabsPages.add(LastGridPage(tabrow['url'], tabrow['sheetName']));
      } else {
        interestTitle = 'Queries';
        return FilelistviewPage(tabrow['url'], tabrow['sheetName']);
      }
    }

    int tabsLen = tabsListResponse['rows'].length; // + 1;
    return DefaultTabController(
      length: tabsLen,
      child: Scaffold(
        appBar: AppBar(
          leading: al.iconBack(context),
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

  Widget fileListBuilder(String layout) {
    return FutureBuilder<String>(
      future: getData(), // async work
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Column(
              children: const [
                Text('Loading home page....'),
                CircularProgressIndicator()
              ],
            );

          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return switchPage(layout);
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
          body: fileListBuilder(widget.layout),
        ));
  }
}
