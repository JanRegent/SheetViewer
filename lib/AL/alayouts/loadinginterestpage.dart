import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:sheetviewer/AL/alayouts/_getdata_layout/home_help.dart';
import 'package:sheetviewer/AL/alayouts/loadlistpage.dart';

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

  void setStateFunc() {
    setState(() {});
  }

  String loadingStatus = 'start';
  String loadingText = '';
  IconButton loadingRun(BuildContext context) {
    return IconButton(
        onPressed: () async {
          loadingStatus = 'loading';
          for (var index = 0;
              index < widget.fileListSheet['rows'].length;
              index++) {
            await loadFileListSheetRow(widget.fileListSheet, index);
            setState(() {
              widget.fileListSheet['rows'][index]['loadingStatus'] = '';
            });
          }
          loadingStatus = '';
          loadingText = 'done:';
        },
        icon: const Icon(Icons.refresh));
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
          leading: loadingRun(context),
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
