import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/alayouts/_filelists/filelistpage.dart';
import 'package:sheetviewer/AL/alayouts/lastgrid/lastnew1.dart';
import 'package:sheetviewer/BL/actionSheet/getsheet.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: HomeScreen(),
        ));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map tabsListResponse = {};
  List<DropdownMenuItem<String>> menuItems = [];
  Future<String> getData() async {
    tabsListResponse = await getSheet(
        '1LZlPCCI0TwWutwquZbC8HogIhqNvxqz0AVR1wrgPlis', 'tabsList');
    menuItems.clear();
    for (var i = 0; i < tabsListResponse['rows'].length; i++) {
      menuItems.add(DropdownMenuItem(
          child: Text(tabsListResponse['rows'][i]['tabName']),
          value: i.toString()));
    }
    return 'ok';
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("USA"), value: "USA"),
      const DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      const DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      const DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  Widget lastQuotesBuilder() {
    return FutureBuilder<String>(
      future: getData(), // async work
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Column(
              children: const [
                Text('Loading home page....'),
                CircularProgressIndicator()
              ],
            );

          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const LastNew1Page(
                  'https://docs.google.com/spreadsheets/d/1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo/edit#gid=179495500',
                  'hledaniList');
              //const HomeScreen();
            }
        }
      },
    );
  }

  String selectedInterest = "USA";

  Row titleRow() {
    return Row(
      children: [
        const Icon(Icons.home),
        const Text(' '),
        DropdownButton(
          value: selectedInterest,
          items: dropdownItems,
          onChanged: (String? value) {
            setState(() {
              selectedInterest = value!;
            });
          },
        ),
        ElevatedButton(
          child: const Text('Last N'),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FileListPage('lastGrid', tabsListResponse)),
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
                      FileListPage('fileList', tabsListResponse)),
            );
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: titleRow()), body: lastQuotesBuilder());
  }
}

// APP

