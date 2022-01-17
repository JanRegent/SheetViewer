// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/sheet/datasheet.dart';
import 'package:sheetviewer/BL/sheet/filelistsheet.dart';
import 'package:sheetviewer/DL/loader/loader.dart';

import 'apidocgridpage.dart';

class EndpointsTabPage extends StatefulWidget {
  const EndpointsTabPage({Key? key}) : super(key: key);

  @override
  _EndpointsTabPageState createState() => _EndpointsTabPageState();
}

TabsListSheet tabsListSheet = TabsListSheet()
  ..tabslistTitle = 'Pro hledace 04tabs';

DataSheet apiSheet = DataSheet();

class _EndpointsTabPageState extends State<EndpointsTabPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<String> getData() async {
    apiSheet = await getdatasheet(
        '1VfBoc8YX3AGF-pLXfTAZKMO4Ig-UnfcrItOyGHCYh9M', 'endpoints');
    return 'ok';
  }

  DefaultTabController tabs() {
    List<Tab> tabsList = [];
    List<Widget> tabsPages = [];
    for (var i = 0; i < apiSheet.rows.length; i++) {
      tabsList.add(Tab(
        text: apiSheet.rows[i]['endpoint'],
      ));
      tabsPages.add(ApidocGridPage(apiSheet.rows[i]['endpoint']));
    }
    return DefaultTabController(
      length: apiSheet.rows.length,
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
