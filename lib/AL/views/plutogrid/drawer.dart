import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sheetviewer/AL/elementsLib/alib.dart';
import 'package:sheetviewer/AL/views/plutogrid/viewhelper.dart';
import 'package:sheetviewer/AL/views/plutogrid/viewhelperpage.dart';

import 'package:sheetviewer/DL/isardb/sheetrows.dart';

import 'filters.dart';

List<SheetRow?> rows = [];
List<String> colsHeader = [];
ViewHelper viewHelper = ViewHelper();

bool sheetViewFromSearch = false;
RxInt rowsCount = 0.obs;
bool detailMode = false;

PlutogridController plutogridContr = PlutogridController();

class PlutogridController extends GetxController {
  var multilineDetailLayuout = ''.obs;
}

Drawer plutoDrawer(BuildContext context, Function setStateFunc, String fileId,
    String sheetName, List<String> cols) {
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
          leading: const Icon(Icons.settings),
          title: const Text('View config helper'),
          onTap: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => ViewHelperPage(fileId, sheetName),
                ));
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.list),
          title: Text(detailMode ? 'Detail mode off' : 'Detail mode on'),
          onTap: () {
            detailMode = !detailMode;
            setStateFunc();
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.filter),
          title: const Text('Filters last'),
          onTap: () {
            handleLoadFilter(viewHelper.gridAStateManager);
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
