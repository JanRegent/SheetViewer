// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/bl.dart';

//import './../views_common.dart';

//import 'gridSettings.dart';

///
///@backlog
///{@backlog}
///   * Styling text with RichText Widget
///     https://hum11farheen.medium.com/styling-text-with-richtext-widget-4d4e881bb0e5

class ShetRowsDetailPage extends StatefulWidget {
  final List<String> cols;
  final List<String> rows_;

  // ignore: prefer_const_constructors_in_immutables
  ShetRowsDetailPage(this.cols, this.rows_, {Key? key}) : super(key: key);

  @override
  _ShetRowsDetailPageState createState() => _ShetRowsDetailPageState();
}

class _ShetRowsDetailPageState extends State<ShetRowsDetailPage> {
  TextEditingController highlighControler = TextEditingController();

  late String cellValue;
  List<String> columnsSelected = [];
  late int colIx;
  late double fontSize = 20;

  //Map<String, HighlightedWord> words = {};
  List<String> wordsStr = [];

  late ScrollController _controller;
  int currentRowsIndex = 0;
  @override
  void initState() {
    _controller = ScrollController();

    columnsSelected = widget.cols;
    //fontSize = bl.appVars.fontSize;
    //highlighControler = new TextEditingController(text: '');
    super.initState();
  }

  void refreshCorrectIndex() {
    if (currentRowsIndex < 0) {
      currentRowsIndex = 0;
    }
    if (currentRowsIndex >= widget.rows_.length) {
      currentRowsIndex = widget.rows_.length - 1;
    }
    setState(() {});
  }

  void arrowLeft() {
    currentRowsIndex -= 1;
    refreshCorrectIndex();
  }

  void arrowRight() {
    currentRowsIndex += 1;
    refreshCorrectIndex();
  }

  Row arrowsRow(BuildContext context) {
    Map row = {'row_': "2"};
    sheetRowsDb
        .readRowNo(widget.rows_[currentRowsIndex])
        .then((value) => {row = jsonDecode("2")});

    return Row(
      children: [
        ElevatedButton(
            child: const Icon(Icons.first_page),
            style: ElevatedButton.styleFrom(primary: Colors.teal),
            onPressed: () {
              currentRowsIndex = 0;
              refreshCorrectIndex();
            }),
        ElevatedButton(
            child: const Icon(Icons.arrow_back, color: Colors.black),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(100, 40), primary: Colors.lightBlue[50]),
            onPressed: () => arrowLeft()),
        const Text(' '),
        ElevatedButton(
            child:
                const Icon(Icons.arrow_forward_outlined, color: Colors.black),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(100, 40), primary: Colors.lightBlue[50]),
            onPressed: () => arrowRight()),
        ElevatedButton(
            child: const Icon(Icons.last_page),
            style: ElevatedButton.styleFrom(primary: Colors.teal),
            onPressed: () {
              currentRowsIndex = widget.rows_.length - 1;
              refreshCorrectIndex();
            }),
        const Text(' row: '),
        Text(row['row_'].toString()),
      ],
    );
  }

  String cellvalueGet(String columnSelected) {
    Map row = jsonDecode(widget.rows_[currentRowsIndex]);
    String cellValue = '';
    try {
      cellValue = row[columnSelected].toString();
    } catch (_) {
      cellValue = '';
    }
    return cellValue;
  }

  Widget getText(int index) {
    TextStyle style = TextStyle(
      fontSize: fontSize,
    );
    String text = cellvalueGet(columnsSelected[index]);

    // ignore: unused_local_variable
    bool containsWord = false;
    for (var i = 0; i < wordsStr.length; i++) {
      if (text.contains(wordsStr[i])) {
        containsWord = true;
        break;
      }
    }

    return Text(
      text,
      style: style,
    );
  }

  Widget detailBody() {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey[50],
        child: ListView.separated(
          controller: _controller,
          separatorBuilder: (context, index) => const Divider(
            color: Colors.blue,
          ),
          itemCount: columnsSelected.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: ListTile(
              leading: Text(columnsSelected[index]),
              title: getText(index),
            )),
          ),
        ));
  }

  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: arrowsRow(context),
      ),
      body: detailBody(),
    );
  }
}
