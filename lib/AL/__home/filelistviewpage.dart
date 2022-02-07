// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/sheet/filelistsheet.dart';
import 'package:sheetviewer/DL/loader/loader.dart';
import 'package:sheetviewer/DL/loader/tablist_filelist.dart';

import 'filelistcard/filelistcard_al1.dart';

class FilelistviewPage extends StatefulWidget {
  final String url;
  final String sheetName;
  const FilelistviewPage(this.url, this.sheetName, {Key? key})
      : super(key: key);

  @override
  _FilelistviewPageState createState() => _FilelistviewPageState();
}

late FileListSheet fileListSheet = FileListSheet()
  ..filelistTitle = 'Pro hledace 04';

class _FilelistviewPageState extends State<FilelistviewPage> {
  @override
  void initState() {
    _controller = ScrollController();

    super.initState();
  }

  Future<String> getData() async {
    fileListSheet = await getFilelist(
        '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis', widget.sheetName);
    await getSheetConfigs(fileListSheet);
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
            itemCount: fileListSheet.rows.length,
            itemBuilder: (context, index) => Center(
                  child: filelistCard(context, fileListSheet, index),
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(fileListSheet.filelistTitle),
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
