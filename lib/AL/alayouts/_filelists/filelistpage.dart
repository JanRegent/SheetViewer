// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/alayouts/byvalue/byvaluepage.dart';
import 'package:sheetviewer/AL/alayouts/lastgrid/lastgridpage.dart';

class FileListPage extends StatefulWidget {
  final String layout;
  final Map selectedInterestMap;
  const FileListPage(this.layout, this.selectedInterestMap, {Key? key})
      : super(key: key);

  @override
  _FileListPageState createState() => _FileListPageState();
}

class _FileListPageState extends State<FileListPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<String> getData() async {
    return 'ok';
  }

  List<DropdownMenuItem<String>> menuItems = [];
  List<DropdownMenuItem<String>> get dropdownItems {
    return menuItems;
  }

  String interestTitle = 'Tabs Demo';

  Widget fileListBuilder(String layout) {
    if (widget.layout == 'lastGrid') {
      return LastGridPage(widget.selectedInterestMap['url'],
          widget.selectedInterestMap['sheetName']);
    } else {
      return ByvaluePage(widget.selectedInterestMap['url'],
          widget.selectedInterestMap['sheetName']);
    }
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
