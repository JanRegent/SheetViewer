import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sheetviewer/DL/isardb/sheetrows.dart';

import '../plutogrid/drawer.dart';

//import './../views_common.dart';

//import 'gridSettings.dart';

///
///@backlog
///{@backlog}
///   * Styling text with RichText Widget
///     https://hum11farheen.medium.com/styling-text-with-richtext-widget-4d4e881bb0e5

class ColumnViewPage extends StatefulWidget {
  final String currentRowsIndexStart;
  final List<String> cols;
  final List<SheetRow?> sheetRows;
  // ignore: prefer_const_constructors_in_immutables
  ColumnViewPage(this.currentRowsIndexStart, this.cols, this.sheetRows,
      {Key? key})
      : super(key: key);

  @override
  _ColumnViewPageState createState() => _ColumnViewPageState();
}

class _ColumnViewPageState extends State<ColumnViewPage> {
  TextEditingController highlighControler = TextEditingController();

  late String cellValue;
  List<String> columnsSelected = [];
  late int colIx;
  late double fontSize = 25;

  late ScrollController _controller;
  int currentRowsIndex = 0;
  @override
  void initState() {
    currentRowsIndex = int.tryParse(widget.currentRowsIndexStart)!;
    _controller = ScrollController();

    columnsSelected = widget.cols;
    //fontSize = bl.appVars.fontSize;
    //highlighControler = new TextEditingController(text: '');
    super.initState();
  }

  Widget getText(Map row) {
    TextStyle style = TextStyle(
      fontSize: fontSize,
    );
    String text = row[plutogridContr.multilineDetailLayuout.value];

    return Text(
      text,
      style: style,
    );
  }

  Widget detailBody() {
    print(currentRowsIndex);
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey[50],
        child: ListView.separated(
          controller: _controller,
          separatorBuilder: (context, index) {
            return const Divider(height: 2);
          },
          itemCount: widget.sheetRows.length,
          itemBuilder: (context, index) {
            Map row = jsonDecode(widget.sheetRows[index]!.row);
            return Column(
              children: <Widget>[
                ListTile(
                  leading: Text(widget.sheetRows[index]!.aRowNo.toString()),
                  title: getText(row),
                  trailing: IconButton(
                    icon: const Icon(Icons.last_page),
                    onPressed: () {},
                  ),
                ),
                const Divider(
                    color:
                        Colors.blue), //                           <-- Divider
              ],
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return detailBody();
  }
}
