import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';
import 'package:get/get.dart';
import 'package:sheetviewer/AL/alayouts/filelistpage/filelistviewpage.dart';
import 'package:sheetviewer/AL/alayouts/last_first_all/lastnew1.dart';

import 'package:sheetviewer/BL/bl.dart';

import 'home_drawer_menu.dart';

Widget gridMenu() {
  const textStyle = TextStyle(fontSize: 26);
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: GridButton(
        textStyle: textStyle,
        borderColor: Colors.grey[300],
        borderWidth: 2,
        onPressed: (dynamic val) async {
          switch (val) {
            case "Last news 1":
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const LastNew1Page(),
                  ));
              break;
            case "By rows":
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => FilelistviewPage(interestContr.cardType),
                  ));
              break;
            case "By words":
              interestContr.cardType = 'By words search';
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => FilelistviewPage(interestContr.cardType),
                  ));
              break;
            case "By tags":
              interestContr.cardType = 'By tags search';
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => FilelistviewPage(interestContr.cardType),
                  ));
              break;
            case "filter":
              interestContr.cardType = 'Select1';
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => FilelistviewPage(interestContr.cardType),
                  ));
              break;
            default:
          }
        },
        items: [
          [
            GridButtonItem(
                title: "Last news 1",
                value: "Last news 1",
                child: Center(
                  child: Row(
                    children: const [Icon(Icons.newspaper), Text('News1')],
                  ),
                ),
                color: Colors.white,
                textStyle: textStyle.copyWith(color: Colors.black),
                shape: const BorderSide(width: 4),
                borderRadius: 30),
            GridButtonItem(
                title: "By rows",
                value: "By rows",
                child: const Icon(Icons.table_rows),
                color: Colors.white,
                textStyle: textStyle.copyWith(color: Colors.black),
                shape: const BorderSide(width: 4),
                borderRadius: 30),
          ],
          [
            GridButtonItem(
                title: "By words",
                value: "By words",
                child: const Icon(Icons.search),
                color: Colors.white,
                textStyle: textStyle.copyWith(color: Colors.black),
                shape: const BorderSide(width: 4),
                borderRadius: 30),
            GridButtonItem(
                title: "By tags",
                value: "By tags",
                child: const Icon(Icons.tag),
                color: Colors.white,
                textStyle: textStyle.copyWith(color: Colors.black),
                shape: const BorderSide(width: 4),
                borderRadius: 30),
          ],
          [
            GridButtonItem(
                child: const Icon(
                  Icons.filter_alt,
                  size: 50,
                ),
                textStyle: textStyle.copyWith(color: Colors.white),
                value: 'filter',
                color: Colors.blue,
                shape: const BorderSide(width: 4),
                borderRadius: 30)
          ],
        ],
      ),
    );
  });
}

// ignore: must_be_immutable
class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Obx(() => Text(interestContr.interestName.value))),
        drawer: homeDrawer(context),
        body: gridMenu()

        // ElevatedButton(
        //   child: const Text('News'),
        //   onPressed: () async {
        //     await Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (ctx) => const LastNew1Page(),
        //         ));
        //   },
        // )

        );
  }
}
