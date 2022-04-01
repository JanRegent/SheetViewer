import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/alayouts/_filelists/filelistpage.dart';
import 'package:sheetviewer/AL/alayouts/lastgrid/lastnew1.dart';
import 'package:sheetviewer/AL/elementsLib/dropdown/customdropdown.dart';

class HomeScreen extends StatefulWidget {
  final Map tabsListResponse;
  final List<String> intererests;
  const HomeScreen(this.tabsListResponse, this.intererests, {Key? key})
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
  Map selectedInterestMap = {};
  void interestChanged(value) {
    try {
      selectedInterest = value;
      selectedInterestMap = widget.tabsListResponse['rows'][0];
      for (var i = 0; i < widget.tabsListResponse['rows'].length; i++) {
        if (widget.tabsListResponse['rows'][i]['interestName'] ==
            selectedInterest) {
          selectedInterestMap = widget.tabsListResponse['rows'][i];
          break;
        }
      }
    } catch (_) {}
  }

  Row titleRow() {
    selectedInterest = widget.intererests[0];
    selectedInterestMap = widget.tabsListResponse['rows'][0];
    return Row(
      children: [
        const Icon(Icons.home),
        const Text(' '),
        CustomDropdownMenu(
            defaultValue: widget.intererests[0],
            values: widget.intererests,
            onItemSelected: interestChanged),
        ElevatedButton(
          child: const Text('Last N'),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FileListPage('lastGrid', selectedInterestMap)),
            );
          },
        ),
        ElevatedButton(
          child: const Text('By values'),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FileListPage('fileList', selectedInterestMap)),
            );
          },
        )
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
