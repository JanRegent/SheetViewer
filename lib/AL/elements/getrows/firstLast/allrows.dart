import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elements/getrows/firstlast/allrowsbutton.dart';

Row allRows(
    BuildContext context, String sheetname, String fileId, String fileTitle) {
  return Row(
    children: [
      const Text('All '),
      allRowsButton(context, sheetname, fileId, fileTitle),
    ],
  );
}
