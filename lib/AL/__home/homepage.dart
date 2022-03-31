import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/alayouts/filelists_tabs/1tabslistpage.dart';
import 'package:sheetviewer/AL/alayouts/lastgrid/lastnew1.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          children: [
            const Icon(Icons.home),
            ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TabsListsPage('lastGrid')),
                );
              },

              //=> context.beamToNamed('/lastGrid'),
              child: const Text('Last N'),
            ),
            ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TabsListsPage('fileList')),
                );
              },

              //=> context.beamToNamed('/fileList'),
              child: const Text('File lists'),
            )
          ],
        )),
        body: const LastNew1Page(
            'https://docs.google.com/spreadsheets/d/1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo/edit#gid=179495500',
            'hledaniList'));
  }
}

// APP
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
