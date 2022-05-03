// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheetviewer/AL/alayouts/byvalue/byvaluepage.dart';
import 'package:sheetviewer/BL/actionSheet/getsheet.dart';
import 'package:sheetviewer/DL/getdata_models.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

import '../last_first_all/last_listview_page.dart';

RowsCountController rowsCountController = RowsCountController();

class GetdataFileListLayout extends StatefulWidget {
  final String layout;
  final Map selectedInterestRow;
  const GetdataFileListLayout(this.layout, this.selectedInterestRow, {Key? key})
      : super(key: key);

  @override
  _GetdataFileListLayoutState createState() => _GetdataFileListLayoutState();
}

class _GetdataFileListLayoutState extends State<GetdataFileListLayout> {
  @override
  void initState() {
    super.initState();
  }

  List<SheetViewConfig> sheetViewConfigs = [];
  late List<dynamic> fileListSheet = [];

  Future<String> getData() async {
    fileListSheet = await getSheet(widget.selectedInterestRow['fileUrl'],
        widget.selectedInterestRow['sheetName']);

    sheetViewConfigs = await fileListSheet2sheetViewConfigs(
        fileListSheet, {'action': 'getRowsLast', 'rowsCount': '10'});

    return 'ok';
  }

  Widget fileListBuilder(String layout) {
    return FutureBuilder<String>(
      future: getData(), // async work
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Column(
              children: const [
                Text('Loading sheet config...'),
                Text(' '),
                Text(' '),
                CircularProgressIndicator()
              ],
            );

          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              if (widget.layout == 'lastGrid') {
                rowsCountBuild(fileListSheet);
                return LastListviewPage(widget.selectedInterestRow,
                    fileListSheet, sheetViewConfigs);
              } else {
                return ByvaluePage(widget.selectedInterestRow, fileListSheet,
                    sheetViewConfigs);
              }
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

void rowsCountBuild(List<dynamic> fileListSheet) {
  for (var i = 0; i < fileListSheet.length; i++) {
    rowsCountController.firstRowsCountAdd();
  }
}

class RowsCountController extends GetxController {
  var firstRowsCount = [].obs;

  int firstRowsCountGet(int index) {
    return firstRowsCount[index];
  }

  firstRowsCountAdd() {
    firstRowsCount.add(11);
  }

  firstRowsCountSet(int index, value) {
    firstRowsCount[index] = value;
  }

  var lastRowsCount = [].obs;

  int lastRowsCountGet(int index) {
    return lastRowsCount[index];
  }

  lastRowsCountSet(int index, value) {
    lastRowsCount[index] = value;
  }
}
