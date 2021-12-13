// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/sheet/filelistsheet.dart';
import 'package:sheetviewer/DL/loader/loader.dart';

import '../views/gridview/_datagridpage.dart';
import 'filelistviewMenu.dart';

class FilelistviewPage extends StatefulWidget {
  final String url;
  final String sheetName;
  const FilelistviewPage(this.url, this.sheetName, {Key? key})
      : super(key: key);

  @override
  _FilelistviewPageState createState() => _FilelistviewPageState();
}

late FileListSheet fileListSheet = FileListSheet()
  ..filelistTitle = 'Pro hledace 04';

class _FilelistviewPageState extends State<FilelistviewPage> {
  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  Future<String> getData() async {
    fileListSheet = await getFilelist(
        '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis', widget.sheetName);
    return 'ok';
  }

  late ScrollController _controller;
  Widget detailBody() {
    ElevatedButton last5(String fileId, int index) {
      Future showGrid() async {
        await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DatagridPage(
                  fileId,
                  fileListSheet.rows[index]['sheetName'],
                  fileListSheet.rows[index]['fileTitle']),
            ));
      }

      return ElevatedButton(
          child: const Text('L5'),
          onPressed: () async {
            await showGrid();
          },
          onLongPress: () async {
            await getdatasheetRefresh(
                fileId, fileListSheet.rows[index]['sheetName']);
            await showGrid();
          });
    }

    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey[50],
        child: ListView.separated(
          controller: _controller,
          separatorBuilder: (context, index) => const Divider(
            color: Colors.blue,
            height: 2.0,
          ),
          itemCount: fileListSheet.rows.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: ListTile(
                    tileColor: Colors.lightBlue[200],
                    isThreeLine: true,
                    leading: last5(
                        bl.bLuti
                            .url2fileid(fileListSheet.rows[index]['fileUrl']),
                        index),
                    title: Text(fileListSheet.rows[index]['fileTitle'],
                        style: const TextStyle(fontSize: 20)),
                    subtitle: Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text('all',
                                style: TextStyle(fontSize: 20))),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text('filter',
                                style: TextStyle(fontSize: 20))),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FilelistDialogPage(title: 'xxc'),
                            ));
                      },
                    ))),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(fileListSheet.filelistTitle),
          backgroundColor: Colors.green,
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
                  //print(fileListSheet.rows);
                  return detailBody();
                }
            }
          },
        )

        //Center(child: filelistGrid()),
        );
  }
}
