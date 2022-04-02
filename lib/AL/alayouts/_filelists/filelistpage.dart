// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/alayouts/byvalue/byvaluepage.dart';
import 'package:sheetviewer/AL/alayouts/lastgrid/lastgridpage.dart';

class FileListPage extends StatefulWidget {
  final String layout;
  final Map selectedInterestRow;
  const FileListPage(this.layout, this.selectedInterestRow, {Key? key})
      : super(key: key);

  @override
  _FileListPageState createState() => _FileListPageState();
}

class _FileListPageState extends State<FileListPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget fileListBuilder(String layout) {
    if (widget.layout == 'lastGrid') {
      return LastGridPage(widget.selectedInterestRow);
    } else {
      return ByvaluePage(widget.selectedInterestRow);
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
