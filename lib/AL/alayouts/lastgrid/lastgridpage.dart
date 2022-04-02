import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:sheetviewer/AL/alayouts/_filelists/home_help.dart';
import 'package:sheetviewer/AL/elements/cards/firstlastgridcard.dart';
import 'package:sheetviewer/AL/alayouts/loadlistpage.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/actionSheet/getsheet.dart';
import 'package:sheetviewer/DL/getdata_models.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

class LastGridPage extends StatefulWidget {
  final Map selectedInterestRow;
  const LastGridPage(this.selectedInterestRow, {Key? key}) : super(key: key);

  @override
  _LastGridPageState createState() => _LastGridPageState();
}

late Map fileListSheet = {};

class _LastGridPageState extends State<LastGridPage> {
  @override
  void initState() {
    super.initState();
    interestName = widget.selectedInterestRow['interestName'];
  }

  void setStateFunc() {
    setState(() {});
  }

  late String interestName;
  List<SheetViewConfig> sheetViewConfigs = [];
  Future<String> getData() async {
    fileListSheet = await getSheet(widget.selectedInterestRow['fileUrl'],
        widget.selectedInterestRow['sheetName']);

    sheetViewConfigs = await fileListSheet2sheetViewConfigs(
        fileListSheet, {'action': 'getRowsLast', 'rowsCount': '10'});

    return 'ok';
  }

  Widget detailBody() {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 236, 240, 241),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 4),
          ),
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          itemCount: fileListSheet['rows'].length,
          itemBuilder: (context, index) {
            return firstlastGridCard(
                context, setStateFunc, sheetViewConfigs[index]);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: ListTile(
            leading: loadingPageShow(fileListSheet, context,
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
          ],
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
                  loadListFileListSheet = fileListSheet;
                  return detailBody();
                }
            }
          },
        )

        //Center(child: filelistGrid()),
        );
  }
}
