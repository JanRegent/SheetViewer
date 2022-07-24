import 'package:flutter/material.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';
import 'package:sheetviewer/AL/elementsLib/alib.dart';

PlutoMenuBar menu(BuildContext context, String fileUrl) {
  return PlutoMenuBar(
    backgroundColor: Colors.blueAccent,
    activatedColor: Colors.white,
    unselectedColor: Colors.white70,
    indicatorColor: Colors.black,
    textStyle: const TextStyle(color: Colors.black, fontSize: 20),
    height: 65,
    menuIconColor: Colors.white,
    menuIconSize: 26,
    moreIconColor: Colors.white,
    menus: getMenus(context, fileUrl),
  );
}

List<PlutoMenuItem> getMenus(BuildContext context, String fileUrl) {
  return [
    PlutoMenuItem(
      title: 'FileList menu',
      icon: Icons.home,
      children: [
        PlutoMenuItem(
          title: 'Open list in browser',
          icon: Icons.group,
          onTap: () => al.linkIconOpenUrl(fileUrl, context),
          children: [
            PlutoMenuItem(
              title: 'Menu 1-1-1',
              onTap: () => al.message(context, 'Menu 1-1-1 tap'),
              children: [
                PlutoMenuItem(
                  title: 'Menu 1-1-1-1',
                  onTap: () => al.message(context, 'Menu 1-1-1-1 tap'),
                ),
                PlutoMenuItem(
                  title: 'Menu 1-1-1-2',
                  onTap: () => al.message(context, 'Menu 1-1-1-2 tap'),
                ),
              ],
            ),
            PlutoMenuItem(
              title: 'Menu 1-1-2',
              onTap: () => al.message(context, 'Menu 1-1-2 tap'),
            ),
          ],
        ),
        PlutoMenuItem(
          title: 'Menu 1-2',
          onTap: () => al.message(context, 'Menu 1-2 tap'),
        ),
        PlutoMenuItem.checkbox(
          title: 'Menu 1-3',
          initialCheckValue: true,
          onTap: () => al.message(context, 'Menu 1-3 tap'),
          onChanged: (flag) => al.message(context, flag.toString()),
        ),
        PlutoMenuItem.radio(
          title: 'Menu 1-3',
          initialRadioValue: _RadioItems.one,
          radioItems: _RadioItems.values,
          onTap: () => al.message(context, 'Menu 1-3 tap'),
          onChanged: (item) => al.message(context, item.toString()),
          getTitle: (item) {
            switch (item as _RadioItems) {
              case _RadioItems.one:
                return 'One';
              case _RadioItems.two:
                return 'Two';
              case _RadioItems.three:
                return 'Three';
            }
          },
        ),
      ],
    ),
    PlutoMenuItem(
      title: 'Menu 2',
      icon: Icons.add_circle,
      children: [
        PlutoMenuItem(
          title: 'Menu 2-1',
          onTap: () => al.message(context, 'Menu 2-1 tap'),
        ),
      ],
    ),
    PlutoMenuItem(
      title: 'Menu 3',
      icon: Icons.apps_outlined,
      onTap: () => al.message(context, 'Menu 3 tap'),
    ),
    PlutoMenuItem(
      title: 'Menu 4',
      onTap: () => al.message(context, 'Menu 4 tap'),
    ),
    PlutoMenuItem(
      title: 'Menu 5',
      onTap: () => al.message(context, 'Menu 5 tap'),
    ),
    PlutoMenuItem(
      title: 'Menu 6',
      children: [
        PlutoMenuItem(
          title: 'Menu 6-1',
          onTap: () => al.message(context, 'Menu 6-1 tap'),
          children: [
            PlutoMenuItem(
              title: 'Menu 6-1-1',
              onTap: () => al.message(context, 'Menu 6-1-1 tap'),
              children: [
                PlutoMenuItem(
                  title: 'Menu 6-1-1-1',
                  onTap: () => al.message(context, 'Menu 6-1-1-1 tap'),
                ),
                PlutoMenuItem(
                  title: 'Menu 6-1-1-2',
                  onTap: () => al.message(context, 'Menu 6-1-1-2 tap'),
                ),
              ],
            ),
            PlutoMenuItem(
              title: 'Menu 6-1-2',
              onTap: () => al.message(context, 'Menu 6-1-2 tap'),
            ),
          ],
        ),
        PlutoMenuItem(
          title: 'Menu 6-2',
          onTap: () => al.message(context, 'Menu 6-2 tap'),
        ),
      ],
    ),
  ];
}

enum _RadioItems {
  one,
  two,
  three,
}
