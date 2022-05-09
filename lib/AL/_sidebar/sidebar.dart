import 'package:flutter/material.dart';

import 'package:sidebarx/sidebarx.dart';

import '../pages/order_table.dart';
import '../pages/topbar.dart';

final List<Map> menu = [
  {'page': 'byRowsPage', 'title': 'By rows', 'icon': Icons.table_rows},
  {'page': 'byValues', 'title': 'By values', 'icon': Icons.dashboard},
  {'page': 'byTags', 'title': 'By tags', 'icon': Icons.tag},
  {'page': 'Select1', 'title': 'Select1', 'icon': Icons.filter_alt}
];

class SidebarXExampleApp extends StatelessWidget {
  SidebarXExampleApp({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0);

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
        body: Row(
          children: [
            SidebarX(
              controller: _controller,
              theme: SidebarXTheme(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: canvasColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: const TextStyle(color: Colors.white),
                selectedTextStyle: const TextStyle(color: Colors.white),
                itemTextPadding: const EdgeInsets.only(left: 30),
                selectedItemTextPadding: const EdgeInsets.only(left: 30),
                itemDecoration: BoxDecoration(
                  border: Border.all(color: canvasColor),
                ),
                selectedItemDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: actionColor.withOpacity(0.37),
                  ),
                  gradient: const LinearGradient(
                    colors: [accentCanvasColor, canvasColor],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.28),
                      blurRadius: 30,
                    )
                  ],
                ),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                  size: 20,
                ),
              ),
              extendedTheme: const SidebarXTheme(
                width: 200,
                decoration: BoxDecoration(
                  color: canvasColor,
                ),
                margin: EdgeInsets.only(right: 10),
              ),
              footerDivider: divider,
              items: [
                SidebarXItem(
                  icon: menu[0]['icon'],
                  label: menu[0]['title'],
                  onTap: () {
                    debugPrint('0');
                  },
                ),
                SidebarXItem(
                  icon: menu[1]['icon'],
                  label: menu[1]['title'],
                  onTap: () {
                    debugPrint('1');
                  },
                ),
                SidebarXItem(
                  icon: menu[2]['icon'],
                  label: menu[2]['title'],
                  onTap: () {
                    debugPrint('2');
                  },
                ),
                SidebarXItem(
                  icon: menu[3]['icon'],
                  label: menu[3]['title'],
                  onTap: () {
                    debugPrint('3');
                  },
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: _ScreensExample(controller: _controller),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        switch (menu[controller.selectedIndex]['page']) {
          case 'byRowsPage':
            return Text(menu[controller.selectedIndex]['page']);
          case 'byValues':
            return Text(
              menu[controller.selectedIndex]['page'],
              style: theme.textTheme.headline5,
            );
          case 'byTags':
            return Text(
              menu[controller.selectedIndex]['page'],
              style: theme.textTheme.headline5,
            );
          case 'Select1':
            return Text(
              menu[controller.selectedIndex]['page'],
              style: theme.textTheme.headline5,
            );
            ;
          default:
            return Text(
              'Not found page',
              style: theme.textTheme.headline5,
            );
        }
      },
    );
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);

final divider = Divider(color: white.withOpacity(0.3), height: 1);
