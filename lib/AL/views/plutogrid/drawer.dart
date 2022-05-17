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
import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbycheckoxes.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/isardb/sheetview.dart';

SheetView sheetViewDrawer = SheetView();

Drawer plutoDrawer(BuildContext context, Function setStateFunc) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          title: const Text('Select columns'),
          onTap: () async {
            Navigator.pop(context);
            List<String> result = await selectListByCheckoxes(
                context, sheetViewDrawer.cols, 'Select columns');
            if (result.isEmpty) return;
            sheetViewDrawer.colsHeader = result;
            await interestStore2.updateListStringSheet(
                sheetViewDrawer.sheetName,
                sheetViewDrawer.fileId,
                'colsHeader',
                sheetViewDrawer.colsHeader);

            setStateFunc();
          },
        ),
        ListTile(
          title: const Text('Reset columns'),
          onTap: () async {
            sheetViewDrawer.colsHeader = sheetViewDrawer.cols;
            await interestStore2.updateListStringSheet(
                sheetViewDrawer.sheetName,
                sheetViewDrawer.fileId,
                'colsHeader',
                sheetViewDrawer.colsHeader);
            setStateFunc();
          },
        ),
        ListTile(
          title: const Text('About'),
          onTap: () async {
            // await Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (ctx) => const About(),
            //     ));
          },
        ),
      ],
    ),
  );
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