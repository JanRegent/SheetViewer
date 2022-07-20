import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';

import 'package:sheetviewer/AL/elementsLib/alib.dart';
import 'package:sheetviewer/AL/views/plutogrid/viewhelper/viewhelper.dart';
import 'package:sheetviewer/AL/views/plutogrid/viewhelper/viewhelperpage.dart';

import 'package:sheetviewer/BL/isardb/sheetrows.dart';

import 'viewhelper/filters.dart';

List<SheetRow?> rows = [];
ViewHelper viewHelper = ViewHelper();
late PlutoRow currentRow; //currentRow is null or PlutoRow.

bool sheetViewFromSearch = false;
RxInt rowsCount = 0.obs;
bool detailMode = false;

PlutogridController plutogridContr = PlutogridController();

class PlutogridController extends GetxController {
  var multilineDetailLayuout = ''.obs;
}

Drawer drawerGrid(BuildContext context, Function setStateFunc, String fileId,
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
        PlutoMenuBar(
          backgroundColor: Colors.blueAccent,
          activatedColor: Colors.white,
          unselectedColor: Colors.white70,
          indicatorColor: Colors.black,
          textStyle: const TextStyle(color: Colors.black, fontSize: 20),
          height: 65,
          menuIconColor: Colors.white,
          menuIconSize: 26,
          moreIconColor: Colors.white,
          menus: getMenus(context),
        ),
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

List<PlutoMenuItem> getMenus(BuildContext context) {
  return [
    PlutoMenuItem(
      title: 'View Config',
      icon: Icons.settings,
      children: [
        PlutoMenuItem(
          title: 'Save locally',
          icon: Icons.save,
          onTap: () async {
            await viewHelper.viewConfigSave();
          },
        ),
        PlutoMenuItem(
          title: 'CSV to clipboard',
          icon: Icons.copy,
          onTap: () async {
            await viewHelper.viewConfi2csv();
          },
        ),
        PlutoMenuItem.checkbox(
          title: 'Menu 1-3',
          initialCheckValue: true,
          onTap: () => al.message(context, 'Menu 1-3 tap'),
          onChanged: (flag) => al.message(context, flag.toString()),
        ),
      ],
    ),
  ];
}
