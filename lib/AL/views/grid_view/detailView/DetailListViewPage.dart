// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '/BL/sheet/any_sheet.dart';

import './../views_common.dart';

//import 'gridSettings.dart';

///
///@backlog
///{@backlog}
///   * Styling text with RichText Widget
///     https://hum11farheen.medium.com/styling-text-with-richtext-widget-4d4e881bb0e5

class DetailListViewPage extends StatefulWidget {
  final AnySheet anySheet;
  // ignore: prefer_const_constructors_in_immutables
  DetailListViewPage(this.anySheet, {Key? key}) : super(key: key);

  @override
  _DetailListViewPageState createState() => _DetailListViewPageState();
}

class _DetailListViewPageState extends State<DetailListViewPage> {
  TextEditingController highlighControler = TextEditingController();

  late String cellValue;
  List<String> columnsSelected = [];
  late int colIx;
  late double fontSize;
  //Map<String, HighlightedWord> words = {};
  List<String> wordsStr = [];

  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();

    columnsSelected = widget.anySheet.cols;
    //fontSize = bl.appVars.fontSize;
    //highlighControler = new TextEditingController(text: '');
    super.initState();
  }

  void refreshCorrectIndex() {
    if (currentStartRowIndex < 0) currentStartRowIndex = 0;
    if (currentStartRowIndex >= widget.anySheet.rows.length) {
      currentStartRowIndex = widget.anySheet.rows.length - 1;
    }
    setState(() {});
  }

  void arrowLeft() {
    currentStartRowIndex -= 1;
    refreshCorrectIndex();
  }

  void arrowRight() {
    currentStartRowIndex += 1;
    refreshCorrectIndex();
  }

  Text rowNo() {
    try {
      return Text(widget.anySheet.rows[currentStartRowIndex].first.toString());
    } catch (_) {
      return const Text(' ');
    }
  }

  Row arrowsButtons(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            child: const Icon(Icons.first_page),
            style: ElevatedButton.styleFrom(primary: Colors.teal),
            onPressed: () {
              currentStartRowIndex = 0;
              refreshCorrectIndex();
            }),
        ElevatedButton(
            child: const Icon(Icons.arrow_back, color: Colors.black),
            style: ElevatedButton.styleFrom(primary: Colors.lightBlue[50]),
            onPressed: () => arrowLeft()),
        // Text(' '),
        // //rowNo(),
        // Text(' '),
        ElevatedButton(
            child:
                const Icon(Icons.arrow_forward_outlined, color: Colors.black),
            style: ElevatedButton.styleFrom(primary: Colors.lightBlue[50]),
            onPressed: () => arrowRight()),
        ElevatedButton(
            child: const Icon(Icons.last_page),
            style: ElevatedButton.styleFrom(primary: Colors.teal),
            onPressed: () {
              currentStartRowIndex = widget.anySheet.rows.length - 1;
              refreshCorrectIndex();
            }),
      ],
    );
  }

  String cellvalueGet(String columnSelected) {
    colIx = widget.anySheet.cols.indexOf(columnSelected);

    cellValue = widget.anySheet.rows[currentStartRowIndex][colIx].toString();
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

  Widget detailBody(AnySheet anySheet) {
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
        title: arrowsButtons(context),
      ),
      body: detailBody(widget.anySheet),
    );
  }
}
