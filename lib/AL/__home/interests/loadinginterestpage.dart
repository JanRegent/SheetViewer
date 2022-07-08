import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sheetviewer/AL/__home/interests/drawer_home.dart';

import 'package:sheetviewer/AL/elementsLib/infodialogs/snack.dart';

class LoadingInterestPage extends StatefulWidget {
  final List<dynamic> fileListSheet;
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
  }

  void setStateFunc() {
    setState(() {});
  }

  @override
  void dispose() {
    Get.delete<Controller>();
    super.dispose();
  }

  Future loadingRunF(BuildContext context) async {
    for (var index = 0; index < widget.fileListSheet.length; index++) {
      statusCont.ls[index] = 'LOADING';
      await loadFileListSheetRow(widget.fileListSheet[index]);
      statusCont.ls[index] = '';
    }

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
                    leading: Obx(() => Text(statusCont.ls[index])),
                    title: Text(widget.fileListSheet[index]['fileTitle'])));
          },
          itemCount: widget.fileListSheet.length,
        ),
      ],
    );
  }

  late final Controller statusCont;
  @override
  Widget build(BuildContext context) {
    statusCont = Get.put(Controller());
    return Scaffold(
        drawer: interestsDrawer(context, setStateFunc),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => loadingRunF(context),
              icon: const Icon(Icons.refresh)),
          title: ListTile(
            title: Text('<-- click to: Loading ${widget.interestName}'),
          ),
          backgroundColor: Colors.lightBlue,
        ),
        body: listviewBody()

        //Center(child: filelistGrid()),
        );
  }
}

IconButton loadingPageShow(
    List<dynamic> fileListSheet, BuildContext context, String interestName) {
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
  for (var index = 0; index < fileListSheet.length; index++) {
    infoSnack(context, 'Loading ' + fileListSheet[index]['fileTitle']);
    await loadFileListSheetRow(fileListSheet[index]);
  }
}

Future loadFileListSheetRow(Map fileListSheetRow) async {
  // String fileId = bl.blUti.url2fileid(fileListSheetRow['fileUrl']);
  // String sheetName = fileListSheetRow['sheetName'];
  // for (var action in actions) {
  //   await sheetViewGetData(fileId, sheetName, action, '');
  // }
}

class Controller extends GetxController {
  var ls = List<String>.generate(100, (counter) => "waiting").obs;
  lsSet(int index) {
    ls[index] = '';
  }
}
