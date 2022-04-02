import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:sheetviewer/AL/alayouts/_filelists/home_help.dart';

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

  void setStateFunc() {
    setState(() {});
  }

  List<SheetViewConfig> sheetViewConfigs = [];

  Widget detailBody() {
    return Stack(
      children: <Widget>[
        ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading:
                    Text(widget.fileListSheet['rows'][index]['loadingStatus']),
                title: Text(widget.fileListSheet['rows'][index]['fileTitle']));
          },
          itemCount: widget.fileListSheet['rows'].length,
        ),
        const Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text('Loading ${widget.interestName}'),
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
        body: detailBody()

        //Center(child: filelistGrid()),
        );
  }
}
