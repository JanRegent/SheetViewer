import 'package:chucker_flutter_ui/chucker_flutter_ui.dart';
import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/alayouts/_getdata_layout/getdata_filelistlayout.dart';
import 'package:sheetviewer/AL/alayouts/last_first_all/lastnew1.dart';
import 'package:sheetviewer/AL/elements/_interests/intetrests_al.dart';

import 'package:sheetviewer/BL/bl.dart';

class HomeScreen extends StatefulWidget {
  final List<dynamic> interestList;
  final List<String> intererests;
  const HomeScreen(this.interestList, this.intererests, {Key? key})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DropdownMenuItem<String>> menuItems = [];
  List<DropdownMenuItem<String>> get dropdownItems {
    for (var i = 0; i < widget.intererests.length; i++) {
      String interestName = '"' + widget.intererests[i].trim() + '"';
      menuItems.add(
        DropdownMenuItem(child: Text(interestName), value: interestName),
      );
    }
    return menuItems;
  }

  String selectedInterest = '';

  Row titleRow() {
    selectedInterest = widget.intererests[0];
    bl.blGlobal.interestRowCurrent = widget.interestList[0];
    return Row(
      children: [
        const Icon(Icons.home),
        const Text(' '),
        interestsDropdown(widget.intererests, widget.interestList, context),
        ElevatedButton(
          child: const Text('Last N'),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GetdataFileListLayout(
                      'lastGrid', bl.blGlobal.interestRowCurrent)),
            );
          },
        ),
        ElevatedButton(
          child: const Text('By values'),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GetdataFileListLayout(
                      'fileList', bl.blGlobal.interestRowCurrent)),
            );
          },
        ),
        ChuckerFlutter.chuckerButton
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: titleRow()),
        body: const LastNew1Page(
            'https://docs.google.com/spreadsheets/d/1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo/edit#gid=179495500',
            'hledaniList'));
  }
}
