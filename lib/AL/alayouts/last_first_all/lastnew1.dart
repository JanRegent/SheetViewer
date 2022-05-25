import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/__home/interests/loadinginterestpage.dart';

import 'package:sheetviewer/DL/loader/getsheet.dart';
import 'package:sheetviewer/BL/bl.dart';

class LastNew1Page extends StatefulWidget {
  const LastNew1Page({Key? key}) : super(key: key);

  @override
  _LastNew1PageState createState() => _LastNew1PageState();
}

class _LastNew1PageState extends State<LastNew1Page> {
  // https://protocoderspoint.com/how-to-implement-read-more-read-less-text-in-flutter/

  late Map fileListLastQuote = {};
  final String url =
      'https://docs.google.com/spreadsheets/d/1soitqp8gukkQeITurQYhWC_gD-AgpOA5cxMPE00MI5A/edit#gid=916411615'; //interestContr.interestsList[1]['fileUrl'],

  final String sheetName =
      'hledaniList'; //interestContr.interestsList[1]['sheetName']
  Future<String> getData() async {
    fileListLastQuote = await getrowslast1quote(url, sheetName);

    return 'ok';
  }

  void setStateFunc() {
    setState(() {});
  }

  bool isReadmore = true;

  Column newsColumn(int index) {
    String lastUpdated =
        fileListLastQuote['rows'][index]['lastUpdated'].toString();
    lastUpdated = lastUpdated.substring(0, lastUpdated.length - 8) + '  ';
    return Column(children: [
      Text(
        fileListLastQuote['rows'][index]['sheetName'],
        style: const TextStyle(fontSize: 30),
      ),
      //text widget to display long text
      buildText(fileListLastQuote['rows'][index]['quote']),
      Row(
        children: [
          Text(lastUpdated),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  // toggle the bool variable true or false
                  isReadmore = !isReadmore;
                });
              },
              child: Text((isReadmore ? 'Read Less' : 'Read More')))
        ],
      )
    ]);
  }

  ScrollController listScrollController = ScrollController();

  ListView newsList() {
    return ListView.builder(
      itemCount: fileListLastQuote.length,
      controller: listScrollController,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            //                    <-- BoxDecoration
            border: Border(bottom: BorderSide()),
          ),
          child: newsColumn(index),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Last new quotes'),
          centerTitle: true,
        ),
        body: FutureBuilder<String>(
          future: getData(), // async work
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                  children: [
                    const Text('Loading last news..'),
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
                  loadListFileListSheet = fileListLastQuote;
                  return newsList();
                }
            }
          },
        )

        //ListView(children: [newsColumn()])

        );
  }

  //----------------------------------------------------------------------
  Widget buildText(String text) {
    // if read more is false then show only 3 lines from text
    // else show full text

    final lines = isReadmore ? null : 3;
    return Text(
      text,
      style: const TextStyle(fontSize: 25),
      maxLines: lines,

      // overflow properties is used to show 3 dot in text widget
      // so that user can understand there are few more line to read.

      overflow: isReadmore ? TextOverflow.visible : TextOverflow.ellipsis,
    );
  }
}
