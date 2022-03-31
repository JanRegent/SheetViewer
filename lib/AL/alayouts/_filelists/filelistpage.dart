// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/alayouts/byvalue/byvaluepage.dart';
import 'package:sheetviewer/AL/alayouts/lastgrid/lastgridpage.dart';

import 'package:sheetviewer/BL/actionSheet/getsheet.dart';

class FileListPage extends StatefulWidget {
  final String layout;
  const FileListPage(this.layout, {Key? key}) : super(key: key);

  @override
  _FileListPageState createState() => _FileListPageState();
}

class _FileListPageState extends State<FileListPage> {
  @override
  void initState() {
    super.initState();
  }

  Map tabsListResponse = {};

  Future<String> getData() async {
    tabsListResponse = await getSheet(
        '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis', 'tabsList');
    menuItems.clear();
    for (var i = 0; i < tabsListResponse['rows'].length; i++) {
      menuItems.add(DropdownMenuItem(
          child: Text(tabsListResponse['rows'][i]['tabName']),
          value: i.toString()));
    }
    return 'ok';
  }

  List<DropdownMenuItem<String>> menuItems = [];
  List<DropdownMenuItem<String>> get dropdownItems {
    return menuItems;
  }

  String interestTitle = 'Tabs Demo';

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
              int i = 0;
              if (widget.layout == 'lastGrid') {
                return LastGridPage(tabsListResponse['rows'][i]['url'],
                    tabsListResponse['rows'][i]['sheetName']);
              } else {
                return ByvaluePage(tabsListResponse['rows'][i]['url'],
                    tabsListResponse['rows'][i]['sheetName']);
              }
              //tabs(context, layout);
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
