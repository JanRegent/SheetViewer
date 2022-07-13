// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/alayouts/byvalue/drawer_byvalue.dart';
import 'package:sheetviewer/AL/elements/getrows/cards/filelistcard_all.dart';

import 'package:sheetviewer/BL/bl.dart';

class ByvaluePage extends StatefulWidget {
  final Map interestRowCurrent;
  final List<dynamic> fileListSheet;

  const ByvaluePage(this.interestRowCurrent, this.fileListSheet, {Key? key})
      : super(key: key);

  @override
  _ByvaluePageState createState() => _ByvaluePageState();
}

late Map fileListSheetV2 = {};

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

  Future<String> getData() async {
    // fileListSheetV2 = await getSheet(widget.interestRowCurrent['fileUrl'],
    //     widget.interestRowCurrent['sheetName']);
    // for (var index = 0; index < fileListSheetV2['rows'].length; index++) {
    //   var queryMap = {'action': 'getRowsLast', 'rowsCount': '10'};
    //   String fileId =
    //       bl.blUti.url2fileid(fileListSheetV2['rows'][index]['fileUrl']);
    //   String sheetName = fileListSheetV2['rows'][index]['sheetName'];
    //   String aQuerystringKey = queryStringKeyBuild(fileId, sheetName, queryMap);
    //   aQuerystringKey = aQuerystringKey;
    // }
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
            itemCount: fileListSheetV2['rows'].length,
            itemBuilder: (context, index) => Center(
                    child: allRowsCard(
                  context,
                  fileListSheetV2,
                  index,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: byValueDrawer(context, setStateFunc),
        appBar: AppBar(
          // leading: loadingPageShow(widget.fileListSheet, context,
          //     widget.interestRowCurrent['interestName']),
          title: Text(interestName),
          backgroundColor: Colors.lightBlue,
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
                  //rint(fileListSheet.rows);
                  return detailBody();
                }
            }
          },
        )

        //Center(child: filelistGrid()),
        );
  }
}
