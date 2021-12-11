import 'package:flutter/material.dart';
import 'package:flutter_json_viewer/flutter_json_viewer.dart';

class JsonViewerPage extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final testObj;
  const JsonViewerPage(this.testObj, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Test json widget"),
        ),
        body: SafeArea(
          child: ListView(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              children: [
                JsonViewer(testObj),
              ]),
        ));
  }
}
