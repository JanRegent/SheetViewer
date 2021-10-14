import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/BL/sheet/filelistsheet.dart';
import 'package:sheetviewer/DL/loader/loader.dart';

import '../views/gridview/_datagridpage.dart';

class FilelistGridApp extends StatelessWidget {
  const FilelistGridApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FilelistGridPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FilelistGridPage extends StatefulWidget {
  const FilelistGridPage({Key? key}) : super(key: key);

  @override
  _FilelistGridPageState createState() => _FilelistGridPageState();
}

late FileListSheet fileListSheet = FileListSheet()
  ..filelistTitle = 'Pro hledace xxx';

class _FilelistGridPageState extends State<FilelistGridPage> {
  Future<String> getData() async {
    String response = await getFilelist();

    fileListSheet = FileListSheet.fromJson(response);

    return 'ok';
  }

  PopupMenuButton popup() {
    return PopupMenuButton(
      initialValue: 2,
      child: const Center(child: Icon(Icons.menu)),
      itemBuilder: (context) {
        return List.generate(5, (index) {
          return PopupMenuItem(
            value: index,
            child: InkWell(
              onTap: () {
                //print(index);
                Navigator.pop(context);
              },
              child: Text('button no $index'),
            ),
          );
        });
      },
    );
  }

  GridView filelistGrid() {
    List<Widget> tiles = [];

    for (var i = 0; i < fileListSheet.rows.length; i++) {
      tiles.add(Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            popup(),
            const Text(' '),
            InkWell(
              onTap: () async {
                String fileId =
                    bl.bLuti.url2fileid(fileListSheet.rows[i]['fileUrl']);

                //runApp(GridViewApp(fileId, fileListSheet.rows[i]['sheetName']));
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DatagridPage(
                          fileId,
                          fileListSheet.rows[i]['sheetName'],
                          fileListSheet.rows[i]['fileTitle']),
                    ));
              },
              child: Text(fileListSheet.rows[i]['fileTitle'],
                  style: const TextStyle(fontSize: 20)),
            )
          ],
        ),
        color: i.isEven ? Colors.yellow : Colors.blue,
      ));
    }
    return GridView.extent(
      primary: false,
      padding: const EdgeInsets.all(16),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      maxCrossAxisExtent: 200.0,
      children: tiles,
    );
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
                  return Center(child: filelistGrid());
                }
            }
          },
        )

        //Center(child: filelistGrid()),
        );
  }
}
