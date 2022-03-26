import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:sheetviewer/AL/__home/tablist_home/home_help.dart';
import 'package:sheetviewer/AL/elements/cards/firstlastgridcard.dart';
import 'package:sheetviewer/AL/elements/load/loadlist.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/actionSheet/getsheet.dart';
import 'package:sheetviewer/DL/getdata_models.dart';
import 'package:sheetviewer/DL/models/sheetviewconfig.dart';

class LastGridApp extends StatefulWidget {
  final String url;
  final String sheetName;
  final String listTitle;
  const LastGridApp(this.url, this.sheetName, this.listTitle, {Key? key})
      : super(key: key);

  @override
  _LastGridAppState createState() => _LastGridAppState();
}

late Map fileListSheet = {};

class _LastGridAppState extends State<LastGridApp> {
  @override
  void initState() {
    super.initState();
  }

  void setStateFunc() {
    setState(() {});
  }

  List<SheetViewConfig> sheetViewConfigs = [];
  Future<String> getData() async {
    fileListSheet = await getSheet(
        '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis', widget.sheetName);

    for (var index = 0; index < fileListSheet['rows'].length; index++) {
      var queryMap = {'action': 'getRowsLast', 'rowsCount': '10'};
      String fileId =
          bl.blUti.url2fileid(fileListSheet['rows'][index]['fileUrl']);
      String sheetName = fileListSheet['rows'][index]['sheetName'];
      String aQuerystringKey = queryStringKeyBuild(fileId, sheetName, queryMap);
      SheetViewConfig? sheetViewConfig =
          await sheetViewConfigDb.readSheet(aQuerystringKey);
      sheetViewConfigs.add(sheetViewConfig!);
    }
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
            return firstlastGridCard(context, setStateFunc, fileListSheet,
                index, sheetViewConfigs[index]);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: ListTile(
            leading: loadList(fileListSheet),
            title: Text(widget.listTitle),
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




// class LastGridApp extends StatelessWidget {
//   final String url;
//   final String sheetName;
//   const LastGridApp(this.url, this.sheetName, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const title = 'Grid List';

//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(title),
//         ),
//         body: 
// GridView.count(
//           // Create a grid with 2 columns. If you change the scrollDirection to
//           // horizontal, this produces 2 rows.
//           crossAxisCount: 2,
//           // Generate 100 widgets that display their index in the List.
//           children: List.generate(100, (index) {
//             return Center(
//               child: Text(
//                 'Item $index',
//                 style: Theme.of(context).textTheme.headline5,
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }