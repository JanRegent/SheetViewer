import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/alayouts/_getdata_layout/getdata_filelistlayout.dart';

import '../pages/topbar.dart';

final List<Map> menu = [
  {'page': 'byRowsPage', 'title': 'By rows', 'icon': Icons.table_rows},
  {'page': 'byValues', 'title': 'By values', 'icon': Icons.dashboard},
  {'page': 'byTags', 'title': 'By tags', 'icon': Icons.tag},
  {'page': 'Select1', 'title': 'Select1', 'icon': Icons.filter_alt}
];

class SidebarXExampleApp extends StatelessWidget {
  const SidebarXExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SidebarX Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headline5: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const TopBar(true),
          ),
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) =>
                              const GetdataFileListLayout('lastGrid'),
                        ));
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          ),
          body: const Text('xx')
          //_ScreensExample(controller: _controller)

          ),
    );
  }
}

// class _ScreensExample extends StatelessWidget {
//   const _ScreensExample({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   final SidebarXController controller;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return
//         // IconButton(
//         //   icon: const Icon(Icons.abc_outlined),
//         //   onPressed: () async {
//         //     await Navigator.push(
//         //         context,
//         //         MaterialPageRoute(
//         //           builder: (ctx) => const GetrowsSelectionPage(),
//         //           //GetdataFileListLayout('lastGrid'),
//         //         ));
//         //   },
//         // );

//         AnimatedBuilder(
//       animation: controller,
//       builder: (context, child) {
//         switch (menu[controller.selectedIndex]['page']) {
//           case 'byRowsPage':
//             return const GetdataFileListLayout('lastGrid');
//           case 'byValues':
//             return Text(
//               menu[controller.selectedIndex]['page'],
//               style: theme.textTheme.headline5,
//             );
//           case 'byTags':
//             return Text(
//               menu[controller.selectedIndex]['page'],
//               style: theme.textTheme.headline5,
//             );
//           case 'Select1':
//             return Text(
//               menu[controller.selectedIndex]['page'],
//               style: theme.textTheme.headline5,
//             );
//             ;
//           default:
//             return Text(
//               'Not found page',
//               style: theme.textTheme.headline5,
//             );
//         }
//       },
//     );
//   }
// }

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);

final divider = Divider(color: white.withOpacity(0.3), height: 1);
