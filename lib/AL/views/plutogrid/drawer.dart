//   menus.add(PopupMenuItem(
//       value: 'Select columns',
//       child: IconButton(
//         icon: const Icon(Icons.view_column_sharp),
//         tooltip: 'Select columns',
//         onPressed: () async {
//           Navigator.pop(context);
//           List<String> result = await selectListByCheckoxes(
//               context, sheetView.cols, 'Select columns');
//           if (result.isEmpty) return;
//           sheetView.colsHeader = result;
//           await interestStore2.updateListStringSheet(sheetView.sheetName,
//               sheetView.fileId, 'colsHeader', sheetView.colsHeader);

//           setState();
//         },
//       )));
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbycheckoxes.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/isardb/sheetrows.dart';
import 'package:sheetviewer/DL/isardb/sheetview.dart';

SheetView sheetViewDrawer = SheetView();
List<SheetRow?> rows = [];
bool sheetViewFromSearch = false;

Drawer plutoDrawer(BuildContext context, Function setStateFunc) {
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
              title: const Text('View drawemenu'),
              trailing: al.helpIcon(context),
            )),
        ListTile(
          leading: const Icon(Icons.view_column),
          title: const Text('Columns select'),
          onTap: () async {
            if (sheetViewDrawer.colsHeader == sheetViewDrawer.cols) {
              return;
            }

            Navigator.pop(context);
            List<String> result = await selectListByCheckoxes(
                context, sheetViewDrawer.cols, 'Columns select');
            if (result.isEmpty) {
              //reset to all cols
              sheetViewDrawer.colsHeader = sheetViewDrawer.cols;
            } else {
              sheetViewDrawer.colsHeader = result;
            }
            await interestStore2.updateListStringSheet(
                sheetViewDrawer.sheetName,
                sheetViewDrawer.fileId,
                'colsHeader',
                sheetViewDrawer.colsHeader);

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

PlutogridController plutogridContr = PlutogridController();

class PlutogridController extends GetxController {
  var multilineDetailLayuout = ''.obs;
}


// PopupMenuButton popup(
//     SheetView sheetView, BuildContext context, Function setState) {
//   List<PopupMenuItem> menus = [];
//   menus.add(PopupMenuItem(
//     value: 'Origin data source show',
//     child: InkWell(
//       onTap: () async {
//         Navigator.pop(context);
//         // await canLaunch(dataSheet.config.sheetIds.fileIdUrl)
//         //     ? await launch(dataSheet.config.sheetIds.fileIdUrl)
//         //     : throw 'Could not launch ${dataSheet.config.sheetIds.fileIdUrl}';
//       },
//       child: const Text('Origin data source show1'),
//     ),
//   ));



//   menus.add(PopupMenuItem(
//       value: 'Reset columns',
//       child: IconButton(
//         icon: const Icon(Icons.view_column_outlined),
//         tooltip: 'Reset columns',
//         onPressed: () async {
//           Navigator.pop(context);
//           sheetView.colsHeader = sheetView.cols;

//           await interestStore2.updateListStringSheet(sheetView.sheetName,
//               sheetView.fileId, 'colsHeader', sheetView.colsHeader);
//           setState();
//         },
//       )));

//   return PopupMenuButton(
//     initialValue: 2,
//     child: const Center(child: Icon(Icons.ac_unit)),
//     itemBuilder: (context) {
//       return menus;
//     },
//   );
// }