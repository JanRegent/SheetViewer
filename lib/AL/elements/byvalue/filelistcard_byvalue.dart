import 'package:flutter/material.dart';

import 'filelistcard_byvalue_columntabs.dart';

class ByValuePage extends StatefulWidget {
  final String fileId;
  final String sheetName;

  const ByValuePage(this.fileId, this.sheetName, {Key? key}) : super(key: key);

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
    Map byValueMap = {'sheetName': widget.sheetName, 'fileId': widget.fileId};
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filter by value in column'),
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
                  //rint(fileListSheet.rows);
                  return ByValueColumnsTabs(byValueMap);
                }
            }
          },
        ));
  }
}
