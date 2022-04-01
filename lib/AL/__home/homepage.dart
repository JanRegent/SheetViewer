import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/alayouts/_filelists/filelistpage.dart';
import 'package:sheetviewer/AL/alayouts/lastgrid/lastnew1.dart';

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

  Function valsel(value) {
    try {
      print(value);
      return value;
    } catch (_) {
      return value;
    }
  }

  Row titleRow() {
    selectedInterest = widget.intererests[0];
    return Row(
      children: [
        const Icon(Icons.home),
        const Text(' '),
        CustomDropdownMenu(
            defaultValue: widget.intererests[0],
            values: widget.intererests,
            onItemSelected: valsel),
        // DropdownButton(

        //   value: selectedInterest,
        //   items: dropdownItems,
        //   onChanged: (String? value) {
        //     setState(() {
        //       selectedInterest = value!;
        //     });
        //   },
        // ),
        ElevatedButton(
          child: const Text('Last N'),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FileListPage('lastGrid', widget.tabsListResponse)),
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
                      FileListPage('fileList', widget.tabsListResponse)),
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

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu(
      {Key? key,
      required this.defaultValue,
      required this.values,
      required this.onItemSelected})
      : super(key: key);
  final dynamic Function(String? selectedValue) onItemSelected;
  final String defaultValue;
  final List<String> values;
  @override
  _CustomDropdownMenuState createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.all(5.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              items: widget.values.map((dropValue) {
                return DropdownMenuItem<String>(
                  value: dropValue,
                  child: Text(dropValue),
                );
              }).toList(),
              onChanged: (newDropdownValue) {
                setState(() {
                  dropdownValue = newDropdownValue!;
                });
                widget.onItemSelected(newDropdownValue);
              },
            ),
          ),
        ),
      ],
    );
  }
}
