import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:sheetviewer/AL/alayouts/_filelists/home_help.dart';

import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

class LoadingInterestPage extends StatefulWidget {
  final Map selectedInterestRow;
  final String interestName;
  const LoadingInterestPage(this.selectedInterestRow, this.interestName,
      {Key? key})
      : super(key: key);

  @override
  _LoadingInterestPageState createState() => _LoadingInterestPageState();
}

late Map fileListSheet = {};

class _LoadingInterestPageState extends State<LoadingInterestPage> {
  @override
  void initState() {
    super.initState();
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
            return ListTile(title: Text(index.toString()));
          },
          itemCount: 10,
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
