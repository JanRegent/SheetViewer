import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';
import 'package:sheetviewer/AL/views/plutogrid/viewconfighelper.dart';

import 'package:sheetviewer/DL/isardb/sheetrows.dart';

import 'filters.dart';

List<SheetRow?> rows = [];
List<String> colsHeader = [];
final List<PlutoColumn> plutoCols = [];

bool sheetViewFromSearch = false;
RxInt rowsCount = 0.obs;
bool detailMode = false;

PlutogridController plutogridContr = PlutogridController();
late PlutoGridStateManager gridAStateManager;

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
                  builder: (ctx) =>
                      ViewConfigHelper(fileId, sheetName, plutoCols),
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
            handleLoadFilter(gridAStateManager);
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
