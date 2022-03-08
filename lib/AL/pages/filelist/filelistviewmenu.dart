// ignore_for_file: file_names, prefer_const_constructors_in_immutables, unused_element, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class FilelistDialogPage extends StatefulWidget {
  FilelistDialogPage({required this.title});

  final String title;

  @override
  _FilelistDialogPageState createState() => _FilelistDialogPageState();
}

class _FilelistDialogPageState extends State<FilelistDialogPage> {
  var language = "Dart";

  _showAlertDialog() {
    final SetListTiles _setListTiles = SetListTiles(
      language: language,
    );

    return showDialog(
      builder: (context) => AlertDialog(
        title: const Text('Choose your favourite programming language!'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              _setListTiles,
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Abort'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                language = _setListTiles.language;
              });
              Navigator.pop(context);
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.cut,
                  color: Colors.black,
                ),
                tooltip: 'Settings',
                onPressed: () async {
                  // await Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => TextParserPage()),
                  // );
                }),
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ListTile(
              leading: Text('Build version'),
              title: Text('bl.buildVersion'),
            ),
            ElevatedButton(
                onPressed: () {}, child: const Icon(Icons.clear_all)),
            TextButton(
              // color: Colors.grey[300],
              // padding: EdgeInsets.all(8.0),
              onPressed: () {}, // _showAlertDialog,
              child: const Text(
                "Choose your favourite programming language!",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const Text(
              "Your favourite programming language is:",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              language,
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        )));
  }
}

// ignore: must_be_immutable
class SetListTiles extends StatefulWidget {
  String language;
  SetListTiles({required this.language});

  @override
  _SetListTilesState createState() => _SetListTilesState();
}

class _SetListTilesState extends State<SetListTiles> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Dart'),
          leading: Radio(
            value: "Dart",
            groupValue: widget.language,
            onChanged: (String? selectedLanguage) {
              setState(() {
                widget.language = selectedLanguage!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Java'),
          leading: Radio(
            value: "Java",
            groupValue: widget.language,
            onChanged: (String? selectedLanguage) {
              setState(() {
                widget.language = selectedLanguage!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Python'),
          leading: Radio(
            value: "Python",
            groupValue: widget.language,
            onChanged: (String? selectedLanguage) {
              setState(() {
                widget.language = selectedLanguage!;
              });
            },
          ),
        ),
      ],
    );
  }
}
