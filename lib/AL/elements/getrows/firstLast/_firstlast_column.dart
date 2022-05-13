import 'package:flutter/material.dart';

import 'allrowsbutton.dart';
import 'firstbutton.dart';
import 'lastrow.dart';

Column firstLastColumn(BuildContext context, String sheetName, String fileId) {
  return Column(
    children: [
      Row(
        children: [
          const Text(' '),
          firstRowsCount(context, sheetName, fileId),
          const Text(' '),
          firstButton(context, sheetName, fileId),
        ],
      ),
      Row(
        children: [
          const Text(' '),
          lastRowsCount(context, sheetName, fileId),
          const Text(' '),
          lastButton(context, sheetName, fileId),
        ],
      ),
      Row(children: [
        const Text(' '),
        allRowsButton(context, sheetName, fileId),
        const Text('   All'),
      ])
    ],
  );
}
