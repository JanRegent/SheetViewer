// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sheetviewer/AL/alayouts/_getdata_layout/home_help.dart';
import 'package:sheetviewer/AL/elements/cards/filelistcard.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';

import 'package:sheetviewer/BL/bl.dart';

import '../../interests/interests_controlers.dart';

class FilelistviewPage extends StatefulWidget {
  final String url;
  final String sheetName;

  const FilelistviewPage(this.url, this.sheetName, {Key? key})
      : super(key: key);

  @override
  _FilelistviewPageState createState() => _FilelistviewPageState();
}

late Map fileListSheet = {};

class _FilelistviewPageState extends State<FilelistviewPage> {
  _FilelistviewPageState();

  @override
  void initState() {
    _controller = ScrollController();

    super.initState();
  }

  void setStateFunc() {
    setState(() {});
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
          leading: al.iconBack(context),
          title: const Text('fileListSheet.filelistTitle'),
          backgroundColor: Colors.lightBlue,
          actions: [
            ElevatedButton(
              child: const Icon(Icons.help),
              onPressed: () => helpToastShow(
                  "Click ob V icon to open cards bb", ToastGravity.CENTER_LEFT),
            ),
          ],
        ),
        body: FutureBuilder<String>(
          future: getDataFilelistSheet(), // async work
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
