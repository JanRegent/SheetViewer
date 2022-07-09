import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';

import 'package:sheetviewer/AL/__home/menu.dart';
import 'package:sheetviewer/AL/alayouts/filelistpage/filelistviewpage.dart';
import 'package:sheetviewer/AL/alayouts/last_first_all/lastnew1.dart';

import 'package:sheetviewer/AL/views/getdata_viewspage.dart';

import 'package:sheetviewer/BL/bl.dart';

import 'home_drawer_menu.dart';

const textStyle = TextStyle(fontSize: 26);
List<List<GridButtonItem>> homepageMenuTiles = [];

// ignore: must_be_immutable
class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  void initMenu() {
    List<List<Map>> menu = [
      [
        {'value': 'Last news', 'icon': Icons.newspaper, 'title': 'News 1'},
        {'value': 'By rows', 'icon': Icons.table_rows, 'title': 'By rows'}
      ],
      [
        {'value': 'By words', 'icon': Icons.search, 'title': 'By words'},
        {'value': 'By tags', 'icon': Icons.tag, 'title': 'By tags'}
      ],
      [
        {'value': 'Select1', 'icon': Icons.filter_alt, 'title': 'Select1'},
        {
          'value': 'Select1and',
          'icon': Icons.filter_alt,
          'title': 'Select1 and'
        },
      ]
    ];

    List<GridButtonItem> gridRow(List<Map> buttRow) {
      return [
        GridButtonItem(
            value: buttRow[0]["value"],
            child: Column(
              children: [
                const Text('\n'),
                Icon(buttRow[0]["icon"]),
                Text(buttRow[0]["title"])
              ],
            ),
            color: Colors.white,
            textStyle: textStyle.copyWith(color: Colors.black),
            shape: const BorderSide(width: 3, color: Colors.blue),
            borderRadius: 30),
        GridButtonItem(
            value: buttRow[1]["value"],
            child: Column(
              children: [
                const Text('\n'),
                Icon(buttRow[1]["icon"]),
                Text(buttRow[1]["title"])
              ],
            ),
            color: Colors.white,
            textStyle: textStyle.copyWith(color: Colors.black),
            shape: const BorderSide(width: 3, color: Colors.blue),
            borderRadius: 30)
      ];
    }

    for (var i = 0; i < menu.length; i++) {
      homepageMenuTiles.add(gridRow(menu[i]));
    }
  }

  Widget gridMenu() {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: GridButton(
            textStyle: textStyle,
            borderColor: Colors.grey[300],
            borderWidth: 2,
            onPressed: (dynamic val) async {
              switch (val) {
                case "Last news":
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const LastNew1Page(),
                      ));
                  break;
                case "By rows":
                  interestContr.cardType = 'byRows';
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) =>
                            FilelistviewPage(interestContr.cardType),
                      ));
                  break;
                case 'By words':
                  interestContr.cardType = 'By words';
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) =>
                            FilelistviewPage(interestContr.cardType),
                      ));
                  break;
                case "By tags":
                  interestContr.cardType = 'By tags search';
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) =>
                            FilelistviewPage(interestContr.cardType),
                      ));
                  break;
                case "filter":
                  interestContr.cardType = 'Select1';
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) =>
                            FilelistviewPage(interestContr.cardType),
                      ));
                  break;
                default:
              }
            },
            items: homepageMenuTiles),
      );
    });
  }

  Future gs(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const GetDataViewsPage('', '', '', '')),
    );
  }

  void setPageTitle(String title, BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
      label: title + ' (SheetsViewer)',
      primaryColor:
          Theme.of(context).primaryColor.value, // This line is required
    ));
  }

  @override
  Widget build(BuildContext context) {
    setPageTitle(interestContr.interestName.value, context);
    initMenu();
    return Scaffold(
        appBar: AppBar(
          title: menu(context),
          //Obx(() => Text(interestContr.interestName.value)),
          actions: [
            //await gs();
            IconButton(
              onPressed: () async {
                await gs(context);
              },
              icon: const Icon(Icons.abc),
            )
          ],
        ),
        drawer: homeDrawer(context),
        body: gridMenu());
  }
}
