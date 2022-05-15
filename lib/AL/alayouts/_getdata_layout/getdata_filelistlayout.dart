// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/__home/interests/interests_controler.dart';

import 'package:sheetviewer/AL/alayouts/byvalue/byvaluepage.dart';
import 'package:sheetviewer/BL/bl.dart';

import '../last_first_all/last_listview_page.dart';

class GetdataFileListLayout extends StatefulWidget {
  final String layout;

  const GetdataFileListLayout(this.layout, {Key? key}) : super(key: key);

  @override
  _GetdataFileListLayoutState createState() => _GetdataFileListLayoutState();
}

class _GetdataFileListLayoutState extends State<GetdataFileListLayout> {
  @override
  void initState() {
    super.initState();
  }

  Widget fileListBuilder(String layout) {
    return FutureBuilder<String>(
      future: interestContr
          .filelistGetData(interestContr.interestRowCurrent), // async work
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
                rowsCountBuild(interestContr.fileListSheet);
                return LastListviewPage(interestContr.interestRowCurrent,
                    interestContr.fileListSheet);
              } else {
                return ByvaluePage(interestContr.interestRowCurrent,
                    interestContr.fileListSheet);
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
