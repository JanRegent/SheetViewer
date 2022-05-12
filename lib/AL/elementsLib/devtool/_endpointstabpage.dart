import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';

import 'package:sheetviewer/DL/isardb/sheetview.dart';

//import 'package:sheetviewer/uti/viewers/json_viewer.dart';

class EndpointsTabPage extends StatefulWidget {
  final SheetView sheetView;
  const EndpointsTabPage(this.sheetView, {Key? key}) : super(key: key);

  @override
  _EndpointsTabPageState createState() => _EndpointsTabPageState();
}

class _EndpointsTabPageState extends State<EndpointsTabPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<String> getData() async {
    // if (widget.dataSheet.sheetTitle != '__empty__') {
    //   sheetConfig = widget.dataSheet.config;
    // } else {
    // sheetConfig = await getSheetConfig(
    //     '1cq0G8ulZLLZgdvwZ_f6Io1a3hupneDqQnaBPSzR39lA', 'elonX');
    //}

    return 'ok';
  }

  DefaultTabController tabs() {
    List<Tab> tabsList = [];
    List<Widget> tabsPages = [];

    tabsList.add(const Tab(
      text: 'getRows',
    ));
    // tabsPages.add(ApidocGridPage(
    //     'getRows', widget.sheetView.sheetName, widget.sheetView.fileId));

    tabsList.add(const Tab(
      text: 'select1',
    ));
    // tabsPages.add(ApidocGridPage(
    //     'select1', widget.sheetView.sheetName, widget.sheetView.fileId));

    tabsList.add(const Tab(
      text: 'bl.globals',
    ));
    //tabsPages.add(BlGlobalsPage());

    tabsList.add(const Tab(
      text: 'json{}',
    ));
    tabsPages.add(
      al.jsonViewer(),
    );

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: tabsList,
          ),
          title: const Text('SheetsViewer Devtool'),
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
