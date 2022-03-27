// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sheetviewer/AL/__home/tablist_home/home_help.dart';
import 'package:sheetviewer/AL/pages/filelist/filelistviewpage.dart';
import 'package:sheetviewer/AL/pages/lastgrid/lastgridpage.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'package:sheetviewer/BL/actionSheet/getsheet.dart';

import 'tablistdrawer.dart';

class TabsListsPage extends StatefulWidget {
  const TabsListsPage({Key? key}) : super(key: key);

  @override
  _TabsListsPageState createState() => _TabsListsPageState();
}

late FToast fToast;

class _TabsListsPageState extends State<TabsListsPage> {
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  void setStateFunc() {
    setState(() {});
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
    List<Widget> tabsPages = [];
    for (var i = 0; i < tabsListResponse['rows'].length; i++) {
      Map tabrow = tabsListResponse['rows'][i];
      tabsList.add(Tab(
        text: tabrow['tabName'],
      ));
      if (bl.tablistView == 'lastGrid') {
        tabsPages.add(LastGridApp(tabrow['url'], tabrow['sheetName']));
      } else {
        tabsPages.add(FilelistviewPage(tabrow['url'], tabrow['sheetName']));
      }
    }

    return DefaultTabController(
      length: tabsListResponse['rows'].length,
      child: Scaffold(
        drawer: tablistDrawer(setStateFunc),
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
