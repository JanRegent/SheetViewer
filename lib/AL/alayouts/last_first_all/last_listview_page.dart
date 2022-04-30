import 'package:chucker_flutter_ui/chucker_flutter_ui.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:sheetviewer/AL/alayouts/_getdata_layout/home_help.dart';
import 'package:sheetviewer/AL/alayouts/loadinginterestpage.dart';

import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

import '../../elements/cards/filelistcard_firstlast_all.dart';

class LastListviewPage extends StatefulWidget {
  final Map selectedInterestRow;
  final Map fileListSheet;
  final List<SheetViewConfig> sheetViewConfigs;
  const LastListviewPage(
      this.selectedInterestRow, this.fileListSheet, this.sheetViewConfigs,
      {Key? key})
      : super(key: key);

  @override
  _LastListviewPageState createState() => _LastListviewPageState();
}

class _LastListviewPageState extends State<LastListviewPage> {
  @override
  void initState() {
    super.initState();
    interestName = widget.selectedInterestRow['interestName'];
  }

  void setStateFunc() {
    setState(() {});
  }

  late String interestName;

  Widget detailBody() {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 236, 240, 241),
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          itemCount: widget.fileListSheet.length,
          itemBuilder: (context, index) {
            return filelistCardFirstLastAll(context, setStateFunc,
                widget.fileListSheet, index, widget.sheetViewConfigs[index]);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: ListTile(
            leading: loadingPageShow(widget.fileListSheet, context,
                widget.selectedInterestRow['interestName']),
            title: Text(interestName),
          ),
          backgroundColor: Colors.lightBlue,
          actions: [
            ElevatedButton(
              child: const Icon(Icons.help),
              onPressed: () => helpToastShow(
                  "Click ob V icon to open cards bb", ToastGravity.CENTER_LEFT),
            ),
            ChuckerFlutter.chuckerButton
          ],
        ),
        body: detailBody()

        //Center(child: filelistGrid()),
        );
  }
}
