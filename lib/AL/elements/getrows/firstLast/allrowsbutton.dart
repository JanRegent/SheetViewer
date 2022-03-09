import 'package:flutter/material.dart';

ElevatedButton allRowsButton(
    BuildContext context, String fileId, String sheetName, String fileTitle) {
  Future showGrid() async {
    // await Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => DatagridPage(
    //           fileId, sheetName, fileTitle, const {"action": 'getSheet'}),
    //     ));
  }

  return ElevatedButton(
      child: const Icon(Icons.all_inbox),
      onPressed: () async {
        await showGrid();
      },
      onLongPress: () async {});
}
