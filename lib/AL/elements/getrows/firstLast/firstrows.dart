import 'package:flutter/material.dart';

import 'firstbutton.dart';

Row firstRows(
    BuildContext context, String sheetname, String fileId, String fileTitle) {
  return Row(
    children: [
      firstRowsCount(context, sheetname, fileId),
      const Text(' '),
      firstButton(context, sheetname, fileId, fileTitle),
    ],
  );
}
