import 'package:flutter/material.dart';

import '../widgets/zoom_menu.dart';

class Write extends StatelessWidget {
  const Write({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple,
        leading: const ZoomMenu(),
        title: const Text("Publish"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        backgroundColor: Colors.purple,
        child: const Icon(Icons.save),
      ),
    );
  }
}
