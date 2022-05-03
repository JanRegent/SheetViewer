// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbycheckoxes.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';

import 'apidocrows.dart';

class BlGlobalsPage extends StatefulWidget {
  BlGlobalsPage({Key? key}) : super(key: key);

  @override
  _BlGlobalsPageState createState() => _BlGlobalsPageState();
}

class _BlGlobalsPageState extends State<BlGlobalsPage> {
  late RowsDataSource rowsDataSource;

  @override
  void initState() {
    super.initState();
  }

  List<String> columnsSelected = [];
  ValueNotifier<int> rowsSelectedIndex = ValueNotifier(0);

  Future<String> getData() async {
    setState(() {});
    return 'ok';
  }

  Text querystringText() {
    return Text(blGlobalsBox.read('bl.globals.querystring'));
  }

  ListView blGlobalsListview() {
    List<Widget> myList = [];
    myList.add(ListTile(
      leading: const Text('contentServiceUrl'),
      title: Text(bl.blGlobal.contentServiceUrl),
      trailing: Text(bl.blGlobal.contentServiceUrlLastModified),
    ));
    myList.add(ListTile(
      leading: const Text('querystring'),
      title: querystringText(),
      trailing: IconButton(
          icon: const Icon(Icons.copy),
          color: Colors.black,
          tooltip: 'Copy columns toi clipboard',
          onPressed: () async {
            FlutterClipboard.copy(blGlobalsBox.read('bl.globals.querystring'))
                .then((value) {});
          }),
    ));
    myList.add(ListTile(
      leading: const Text('fullUrl'),
      title: Text(bl.blGlobal.contentServiceUrl +
          blGlobalsBox.read('bl.globals.querystring')),
      trailing: IconButton(
          icon: const Icon(Icons.copy),
          color: Colors.black,
          tooltip: 'Copy columns toi clipboard',
          onPressed: () async {
            FlutterClipboard.copy(bl.blGlobal.contentServiceUrl +
                    blGlobalsBox.read('bl.globals.querystring'))
                .then((value) {});
          }),
    ));

    return ListView.separated(
        itemCount: myList.length,
        // The list items
        itemBuilder: (context, index) {
          return myList[index];
        },
        // The separators
        separatorBuilder: (context, index) {
          return Divider(
            color: Theme.of(context).primaryColor,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BL globals'),
        actions: [
          IconButton(
              onPressed: () async {
                List<String> result = await selectListByCheckoxes(
                    context, columnsSelected, 'Select columns');
                if (result.isEmpty) return;

                setState(() {
                  columnsSelected = result;
                });
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder<String>(
        future: getData(), // async work
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
                return blGlobalsListview();
              }
          }
        },
      ),
    );
  }
}
