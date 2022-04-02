import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:sheetviewer/AL/alayouts/_getdata_layout/home_help.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';

import 'package:sheetviewer/AL/elementsLib/infodialogs/snack.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/getdata_models.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

class LoadingInterestPage extends StatefulWidget {
  final Map fileListSheet;
  final String interestName;
  const LoadingInterestPage(this.fileListSheet, this.interestName, {Key? key})
      : super(key: key);

  @override
  _LoadingInterestPageState createState() => _LoadingInterestPageState();
}

class _LoadingInterestPageState extends State<LoadingInterestPage> {
  @override
  void initState() {
    super.initState();

    for (var index = 0; index < widget.fileListSheet['rows'].length; index++) {
      widget.fileListSheet['rows'][index]['loadingStatus'] = 'waiting';
    }
  }

  String loadingStatus = 'start';
  String loadingText = '';
  IconButton loadingAndPop(BuildContext context) {
    if (loadingText != 'done:') {
      return IconButton(
          onPressed: () => loadingRunF(context),
          icon: const Icon(Icons.refresh));
    } else {
      return al.iconBackDialog(context);
    }
  }

  Future loadingRunF(BuildContext context) async {
    loadingStatus = 'loading';
    for (var index = 0; index < widget.fileListSheet['rows'].length; index++) {
      await loadFileListSheetRow(widget.fileListSheet, index);
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        widget.fileListSheet['rows'][index]['loadingStatus'] = '';
      });
    }
    await Future.delayed(const Duration(seconds: 2));
    loadingStatus = '';
    loadingText = 'done:';
    Navigator.pop(context);
  }

  Widget listviewBody() {
    return Stack(
      children: <Widget>[
        ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
                color: index % 2 == 0
                    ? const Color.fromARGB(255, 110, 108, 108)
                    : Colors.white,
                child: ListTile(
                    leading: Text(
                        widget.fileListSheet['rows'][index]['loadingStatus']),
                    title: Text(
                        widget.fileListSheet['rows'][index]['fileTitle'])));
          },
          itemCount: widget.fileListSheet['rows'].length,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: loadingAndPop(context),
          title: ListTile(
            title: Text('Loading ${widget.interestName}'),
            leading: loadingStatus == 'loading'
                ? const CircularProgressIndicator(color: Colors.red)
                : Text(loadingText),
          ),
          backgroundColor: Colors.lightBlue,
          actions: [
            ElevatedButton(
              child: const Icon(Icons.help),
              onPressed: () => helpToastShow(
                  "Click ob V icon to open cards bb", ToastGravity.CENTER_LEFT),
            ),
          ],
        ),
        body: listviewBody()

        //Center(child: filelistGrid()),
        );
  }
}

IconButton loadingPageShow(
    Map fileListSheet, BuildContext context, String interestName) {
  return IconButton(
      onPressed: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LoadingInterestPage(fileListSheet, interestName)),
        );
      },
      icon: const Icon(Icons.refresh));
}

String loadListSheetName = 'space';
Map loadListFileListSheet = {};
IconButton loadList(Map fileListSheet, BuildContext context) {
  return IconButton(
      onPressed: () async {
        await loadListByActions(loadListFileListSheet, context);
      },
      icon: const Icon(Icons.refresh));
}

List<String> actions = ['getRowsFirst', 'getRowsLast'];

Future loadListByActions(Map fileListSheet, BuildContext context) async {
  for (var index = 0; index < fileListSheet['rows'].length; index++) {
    infoSnack(context, 'Loading ' + fileListSheet['rows'][index]['fileTitle'],
        AnimatedSnackBarType.info);
    await loadFileListSheetRow(fileListSheet, index);
  }
  infoSnack(context, 'Done', AnimatedSnackBarType.info);
}

Future loadFileListSheetRow(Map fileListSheet, int index) async {
  String fileId = bl.blUti.url2fileid(fileListSheet['rows'][index]['fileUrl']);
  String sheetName = fileListSheet['rows'][index]['sheetName'];
  for (var action in actions) {
    await sheetViewGetData(fileId, sheetName, action, SheetViewConfig());
  }
}
