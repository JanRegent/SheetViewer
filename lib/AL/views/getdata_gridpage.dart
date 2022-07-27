// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';

import 'package:sheetviewer/BL/bl.dart';

import 'autoview1_gridview.dart';
import 'plutogrid/_gridpage.dart';
import 'plutogrid/drawergrid.dart';

/// The home page of the application which hosts the datagrid.
class GetDataViewsPage extends StatefulWidget {
  final String sheetName;
  final String fileId;
  final String fileTitle;
  final bool autorun;

  // ignore: use_key_in_widget_constructors
  const GetDataViewsPage(
      this.sheetName, this.fileId, this.fileTitle, this.autorun);

  @override
  _GetDataViewsPageState createState() => _GetDataViewsPageState();
}

class _GetDataViewsPageState extends State<GetDataViewsPage> {
  @override
  void initState() {
    super.initState();
  }

  void setStateFunc() {
    setState(() {});
  }

  ListTile appBarTile(BuildContext context) {
    return ListTile(
        leading: widget.autorun ? null : al.iconBack(context),
        title: Text(widget.fileTitle));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawerGrid(
            context, setStateFunc, widget.fileId, widget.sheetName, cols),
        appBar: AppBar(title: appBarTile(context)),
        body: FutureBuilder(
          future: getData4view(widget.fileId, widget.sheetName), // async work
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                  children: [
                    Text('Loading \n ' +
                        widget.sheetName +
                        ' \n from: ' +
                        widget.fileId +
                        '\n\n'),
                    Obx(() => Text(filelistContr.fetshingRows.value)),
                    const Text(' '),
                    const CircularProgressIndicator()
                  ],
                );

              default:
                if (snapshot.hasError) {
                  return Text('GetDataViewsPage Error: ${snapshot.error}');
                } else {
                  if (sheetRows.isNotEmpty) return GridPage(sheetRows);
                  if (filelistContr.searchWordInAllSheets.value.isEmpty) {
                    return Text('Sheet ${widget.sheetName} is empty');
                  }
                  return Text(
                      'Sheet ${widget.sheetName} filter result is empty\n filter is: \n rows contains ${filelistContr.searchWordInAllSheets.value}');
                }
            }
          },
        ));
  }
}
