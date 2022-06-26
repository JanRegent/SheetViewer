import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sheetviewer/AL/__home/interests/loadinginterestpage.dart';

class LastNew1Page extends StatefulWidget {
  const LastNew1Page({Key? key}) : super(key: key);

  @override
  _LastNew1PageState createState() => _LastNew1PageState();
}

class _LastNew1PageState extends State<LastNew1Page> {
  late Map fileListLastQuote = {};
  final String url =
      'https://docs.google.com/spreadsheets/d/1soitqp8gukkQeITurQYhWC_gD-AgpOA5cxMPE00MI5A/edit#gid=916411615'; //interestContr.interestsList[1]['fileUrl'],

  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  final String sheetName =
      'hledaniList'; //interestContr.interestsList[1]['sheetName']
  Future<String> getData() async {
    // fileListLastQuote = await getrowslast1quote(url, sheetName);
    return 'ok';
  }

  late double fontSize = 25;
  Widget getText(Map row) {
    TextStyle style = TextStyle(
      fontSize: fontSize,
    );
    String text = row['quote'];

    return Text(
      text,
      style: style,
    );
  }

  Text lastUpdated(Map row) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var lastDate = inputFormat.parse(row['lastUpdated'].toString());
    try {
      return Text(lastDate.toString().split(' ')[0]);
    } catch (_) {
      return const Text(' ');
    }
  }

  List<Widget> listviewItems() {
    List<Widget> items = [];

    for (var index = 0; index <= fileListLastQuote.length; index++) {
      try {
        Map row = fileListLastQuote['rows'][index];
        items.add(
          ListTile(
            leading: Text(row['sheetName'] + '\n' + row['row_'].toString()),
            title: getText(row),
            subtitle: lastUpdated(row),
            trailing: IconButton(
              icon: const Icon(Icons.last_page),
              onPressed: () {},
            ),
          ),
        );
        items.add(const Divider(color: Colors.blue, height: 2));
      } catch (_) {}
    }
    return items;
  }

  Widget listViewBody() {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey[50],
        child: ListView(
          controller: _controller,
          children: listviewItems(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Last new quotes'),
        ),
        body: FutureBuilder<String>(
          future: getData(), // async work
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                  children: const [
                    Text('Loading last news..'),
                    Text(' '),
                    CircularProgressIndicator()
                  ],
                );

              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  loadListFileListSheet = fileListLastQuote;
                  return listViewBody();
                }
            }
          },
        ));
  }
}
