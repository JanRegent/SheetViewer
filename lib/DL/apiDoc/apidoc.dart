// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/sheet/sheet_config.dart';
import 'package:sheetviewer/DL/loader/loader.dart';

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
    sheetConfig.toString();
    return 'ok';
  }

  DefaultTabController tabs() {
    List<Tab> tabsList = [];
    List<Widget> tabsPages = [];

    tabsList.add(const Tab(
      text: 'getRows',
    ));
    tabsPages.add(ApidocGridPage('getRows', sheetConfig)); //

    tabsList.add(const Tab(
      text: 'select1',
    ));
    tabsPages.add(const Text('select1'));

    return DefaultTabController(
      length: 2,
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
