import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/sheet/sheet_config.dart';

import 'package:sheetviewer/DL/loader/loader.dart';
import 'package:sheetviewer/uti/viewers/json_viewer.dart';

import 'filelistcard_byvalue_columntabs.dart';

class ByValuePage extends StatefulWidget {
  final String fileId;
  final String sheetName;

  const ByValuePage(this.fileId, this.sheetName, {Key? key}) : super(key: key);

  @override
  _ByValePageState createState() => _ByValePageState();
}

class _ByValePageState extends State<ByValuePage> {
  SheetConfig sheetConfig = SheetConfig();

  Future<String> getConfig() async {
    sheetConfig = await getSheetConfig(widget.fileId, widget.sheetName);
    return 'ok';
  }

  IconButton jsonViewer() {
    return IconButton(
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => JsonViewerPage(sheetConfig.rawConfig)));
        },
        icon: const Icon(Icons.view_agenda));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filter by value in column'),
          actions: [
            jsonViewer(),
          ],
        ),
        body: FutureBuilder<String>(
          future: getConfig(), // async work
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                  children: const [
                    Text('Loading....'),
                    CircularProgressIndicator()
                  ],
                );

              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  //print(fileListSheet.rows);
                  return ByValueColumnsTabs(sheetConfig);
                }
            }
          },
        ));
  }
}
