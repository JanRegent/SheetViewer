import 'package:flutter/material.dart';

import 'allrowsbutton.dart';
import 'firstbutton.dart';
import 'lastrow.dart';

Column firstLastColumn(
    BuildContext context, String sheetName, String fileId, String fileTitle) {
  return Column(
    children: [
      Row(
        children: [
          const Text(' '),
          firstRowsCount(context, sheetName, fileId),
          const Text(' '),
          firstButton(context, sheetName, fileId, fileTitle),
        ],
      ),
      Row(
        children: [
          const Text(' '),
          lastRowsCount(context, sheetName, fileId),
          const Text(' '),
          lastButton(context, sheetName, fileId, fileTitle),
        ],
      ),
      Row(children: [
        const Text(' '),
        allRowsButton(context, sheetName, fileId, fileTitle),
        const Text('   All'),
      ])
    ],
  );
}
