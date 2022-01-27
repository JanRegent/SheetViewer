// ignore_for_file: file_names

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'package:sheetviewer/BL/sheet/sheet_config.dart';
import 'package:sheetviewer/DL/loader/loader.dart';
import 'package:sheetviewer/uti/viewers/json_viewer.dart';

import 'apidocgridpage.dart';

class EndpointsTabPage extends StatefulWidget {
  const EndpointsTabPage({Key? key}) : super(key: key);

  @override
  _EndpointsTabPageState createState() => _EndpointsTabPageState();
}

SheetConfig sheetConfig = SheetConfig();

class _EndpointsTabPageState extends State<EndpointsTabPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<String> getData() async {
    sheetConfig = await getSheetConfig(
        '1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA', 'elonX');

    return 'ok';
  }

  IconButton jsonViewer() {
    return IconButton(
        onPressed: () async {
          //bl.dataSheet4debug = ;
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => JsonViewerPage(sheetConfig.rawConfig)));
        },
        icon: const Icon(Icons.view_agenda));
  }

  ListView blGlobalsListview() {
    List<Widget> myList = [];
    myList.add(ListTile(
      leading: const Text('contentServiceUrl'),
      title: Text(bl.blGlobal.contentServiceUrl),
      trailing: Text(bl.blGlobal.contentServiceUrlLastModified),
    ));
    myList.add(ListTile(
      leading: const Text('querystring'),
      title: Text(bl.blGlobal.querystring),
      trailing: IconButton(
          icon: const Icon(Icons.copy),
          color: Colors.black,
          tooltip: 'Copy columns toi clipboard',
          onPressed: () async {
            FlutterClipboard.copy(bl.blGlobal.querystring).then((value) {});
          }),
    ));
    myList.add(ListTile(
      leading: const Text('fullUrl'),
      title: Text(bl.blGlobal.contentServiceUrl + bl.blGlobal.querystring),
      trailing: IconButton(
          icon: const Icon(Icons.copy),
          color: Colors.black,
          tooltip: 'Copy columns toi clipboard',
          onPressed: () async {
            FlutterClipboard.copy(
                    bl.blGlobal.contentServiceUrl + bl.blGlobal.querystring)
                .then((value) {});
          }),
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

  DefaultTabController tabs() {
    List<Tab> tabsList = [];
    List<Widget> tabsPages = [];

    tabsList.add(const Tab(
      text: 'getRows',
    ));
    tabsPages.add(ApidocGridPage('getRows', sheetConfig));

    tabsList.add(const Tab(
      text: 'select1',
    ));
    tabsPages.add(ApidocGridPage('select1', sheetConfig));

    tabsList.add(const Tab(
      text: 'bl.globals',
    ));
    tabsPages.add(blGlobalsListview());

    tabsList.add(const Tab(
      text: 'json',
    ));
    tabsPages.add(JsonViewerPage(sheetConfig.rawConfig));

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: tabsList,
          ),
          title: const Text('SheetsViewer backend API'),
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
                    Text('Loading....'),
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
