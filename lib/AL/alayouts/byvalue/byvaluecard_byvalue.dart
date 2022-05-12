import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';

class ByValuePage extends StatefulWidget {
  final String sheetName;
  final String fileId;
  // ignore: use_key_in_widget_constructors
  const ByValuePage(this.fileId, this.sheetName);

  @override
  _ByValePageState createState() => _ByValePageState();
}

class _ByValePageState extends State<ByValuePage> {
  Future<String> getConfig() async {
    //sheetConfig = await getSheetConfig(widget.fileId, widget.sheetName);
    return 'ok';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filter by value in column'),
          actions: [
            al.jsonViewer(),
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
                  return const Text('to do');

                  // ByValueColumnsTabs(sheetConfig);
                }
            }
          },
        ));
  }
}
