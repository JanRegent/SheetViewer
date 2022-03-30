import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elements/load/loadlist.dart';
import 'package:sheetviewer/BL/actionSheet/getsheet.dart';
import 'package:sheetviewer/BL/bl.dart';

class LastNew1Page extends StatefulWidget {
  final String url;
  final String sheetName;
  const LastNew1Page(this.url, this.sheetName, {Key? key}) : super(key: key);

  @override
  _LastNew1PageState createState() => _LastNew1PageState();
}

class _LastNew1PageState extends State<LastNew1Page> {
  // bool datatype to give toggle effect to button and
  // depending on this bool value will show full text or
  // limit the number of line to be viewed in text.

  late Map fileListSheet = {};

  Future<String> getData() async {
    fileListSheet = await getSheet(widget.url, widget.sheetName);
    return 'ok';
  }

  bool isReadmore = false;

  Column newsColumn(String fileTitle) {
    return Column(children: [
      Text(
        fileTitle,
        style: const TextStyle(fontSize: 30),
      ),
      //text widget to display long text
      buildText(
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
      ElevatedButton(
          onPressed: () {
            setState(() {
              // toggle the bool variable true or false
              isReadmore = !isReadmore;
            });
          },
          child: Text((isReadmore ? 'Read Less' : 'Read More')))
    ]);
  }

  ListView newsList() {
    return ListView.builder(
      itemCount: fileListSheet['rows'].length,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            //                    <-- BoxDecoration
            border: Border(bottom: BorderSide()),
          ),
          child: newsColumn(fileListSheet['rows'][index]['fileTitle']),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Last new quotes'),
          centerTitle: true,
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
                  return newsList();
                }
            }
          },
        )

        //ListView(children: [newsColumn()])

        );
  }

  //----------------------------------------------------------------------
  Widget buildText(String text) {
    // if read more is false then show only 3 lines from text
    // else show full text

    final lines = isReadmore ? null : 3;
    return Text(
      text,
      style: const TextStyle(fontSize: 25),
      maxLines: lines,

      // overflow properties is used to show 3 dot in text widget
      // so that user can understand there are few more line to read.

      overflow: isReadmore ? TextOverflow.visible : TextOverflow.ellipsis,
    );
  }
}
