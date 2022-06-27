import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbycheckoxes.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/isardb/sheetrows.dart';

List<SheetRow?> rows = [];
List<String> colsHeader = [];
bool sheetViewFromSearch = false;
RxInt rowsCount = 0.obs;

PlutogridController plutogridContr = PlutogridController();

class PlutogridController extends GetxController {
  var multilineDetailLayuout = ''.obs;
}

Drawer plutoDrawer(BuildContext context, Function setStateFunc, String fileId,
    String sheetName) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 169, 213, 234),
            ),
            child: ListTile(
              title: Obx(() => Text('Rows count: ${rowsCount.value}')),
              trailing: al.helpIcon(context),
            )),
        ListTile(
          leading: const Icon(Icons.view_column),
          title: const Text('Columns select'),
          onTap: () async {
            List<String> cols = await sheetRowsDb.readCols(fileId, sheetName);
            if (colsHeader == cols) {
              return;
            }

            Navigator.pop(context);
            List<String> result =
                await selectListByCheckoxes(context, cols, 'Columns select');

            if (result.isEmpty) {
              //reset to all cols
              colsHeader = cols;
            } else {
              colsHeader = result;
            }
            setStateFunc();
          },
        ),
        ListTile(
          leading: const Icon(Icons.multiline_chart),
          title: const Text('Multiline-details on'),
          subtitle:
              Obx(() => Text(plutogridContr.multilineDetailLayuout.value)),
          onTap: () {
            plutogridContr.multilineDetailLayuout.value = '';
            setStateFunc();
          },
        ),
      ],
    ),
  );
}
