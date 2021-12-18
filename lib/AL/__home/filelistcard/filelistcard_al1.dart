import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/sheet/filelistsheet.dart';

import 'filelistcard_al2exp.dart';

Card filelistCard(
    BuildContext context, FileListSheet fileListSheet, int index) {
  return Card(
    shape: RoundedRectangleBorder(
      side: BorderSide.merge(
          const BorderSide(
              width: 1.5, color: Colors.lightBlue, style: BorderStyle.solid),
          const BorderSide(
              width: 1.5, color: Colors.lightBlue, style: BorderStyle.solid)),
      borderRadius: BorderRadius.circular(20),
    ),
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [expansionFilelistCard(context, fileListSheet, index)],
    ),
  );
}
