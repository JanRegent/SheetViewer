import 'package:flutter/material.dart';

import 'package:sheetviewer/DL/isardb/sheetviewconfig.dart';

import 'firstbutton.dart';

Row firstRows(
    BuildContext context, int index, SheetViewConfig sheetViewConfig) {
  return Row(
    children: [
      firstRowsCount(context, index, sheetViewConfig),
      const Text(' '),
      firstButton(context, sheetViewConfig),
    ],
  );
}
