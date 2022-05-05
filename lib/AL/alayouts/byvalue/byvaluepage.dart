// ignore_for_file: file_names

import 'package:chucker_flutter_ui/chucker_flutter_ui.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sheetviewer/AL/alayouts/_getdata_layout/home_help.dart';
import 'package:sheetviewer/AL/alayouts/loadinginterestpage.dart';
import 'package:sheetviewer/AL/elements/cards/filelistcard.dart';

import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/actionSheet/getsheet.dart';
import 'package:sheetviewer/DL/getdata_models.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

class ByvaluePage extends StatefulWidget {
  final Map interestRowCurrent;
  final List<dynamic> fileListSheet;
  final List<SheetViewConfig> sheetViewConfigs;
  const ByvaluePage(
      this.interestRowCurrent, this.fileListSheet, this.sheetViewConfigs,
      {Key? key})
      : super(key: key);

  @override
  _ByvaluePageState createState() => _ByvaluePageState();
}

late Map fileListSheet = {};

class _ByvaluePageState extends State<ByvaluePage> {
  _ByvaluePageState();

  @override
  void initState() {
    _controller = ScrollController();

    interestName = widget.interestRowCurrent['interestName'];
    super.initState();
  }

  late String interestName;
  void setStateFunc() {
    setState(() {});
  }

  List<SheetViewConfig> sheetViewConfigs = [];
  Future<String> getData() async {
    fileListSheet = await getSheet(widget.interestRowCurrent['fileUrl'],
        widget.interestRowCurrent['sheetName']);
    for (var index = 0; index < fileListSheet['rows'].length; index++) {
      var queryMap = {'action': 'getRowsLast', 'rowsCount': '10'};
      String fileId =
          bl.blUti.url2fileid(fileListSheet['rows'][index]['fileUrl']);
      String sheetName = fileListSheet['rows'][index]['sheetName'];
      String aQuerystringKey = queryStringKeyBuild(fileId, sheetName, queryMap);
      SheetViewConfig? sheetViewConfig =
          await sheetViewConfigDb.readSheet(aQuerystringKey);
      sheetViewConfigs.add(sheetViewConfig!);
    }
    return 'ok';
  }

  late ScrollController _controller;

  Widget detailBody() {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey[50],
        child: ListView.separated(
            controller: _controller,
            separatorBuilder: (context, index) => const Divider(
                  color: Colors.red,
                  height: 4.0,
                ),
            itemCount: fileListSheet['rows'].length,
            itemBuilder: (context, index) => Center(
                  child: filelistCard(
                      context, fileListSheet, index, sheetViewConfigs[index]),
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: loadingPageShow(widget.fileListSheet, context,
              widget.interestRowCurrent['interestName']),
          title: Text(interestName),
          backgroundColor: Colors.lightBlue,
          actions: [
            ElevatedButton(
              child: const Icon(Icons.help),
              onPressed: () => helpToastShow(
                  "Click ob V icon to open cards bb", ToastGravity.CENTER_LEFT),
            ),
            ChuckerFlutter.chuckerButton
          ],
        ),
        body: FutureBuilder<String>(
          future: getData(), // async work
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                  children: [
                    const Text('Loading sheet config...'),
                    const Text(' '),
                    ValueListenableBuilder(
                      valueListenable: bl.blGlobal.loadingMessage,
                      builder: (context, value, child) => Text(
                        '$value',
                      ),
                    ),
                    const Text(' '),
                    const CircularProgressIndicator()
                  ],
                );

              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  //print(fileListSheet.rows);
                  return detailBody();
                }
            }
          },
        )

        //Center(child: filelistGrid()),
        );
  }
}
