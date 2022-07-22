// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sheetviewer/AL/__home/_home_filelist/home_drawer_menu.dart';

import 'package:sheetviewer/AL/elementsLib/alib.dart';
import 'package:sheetviewer/BL/bl.dart';

import 'filelistcard.dart';

import '../search/cool_search_bar.dart';

// ignore: must_be_immutable
class FilelistviewHomePage extends StatelessWidget {
  final String cardType;

  const FilelistviewHomePage(this.cardType, {Key? key}) : super(key: key);

  Widget detailBody() {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey[50],
        child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
                  color: Colors.red,
                  height: 4.0,
                ),
            itemCount: interestContr.interestFilelist.length,
            itemBuilder: (context, index) => Center(
                child: filelistCard(
                    context, interestContr.interestFilelist[index], index))));
  }

  void setPageTitle(String title, BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
      label: title + ' (SheetsViewer)',
      primaryColor:
          Theme.of(context).primaryColor.value, // This line is required
    ));
  }

  IconButton searchBar(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      tooltip: 'Search word in all sheets',
      onPressed: () async {
        try {
          interestContr.searchWordInAllSheets.value = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const CoolSearchBar(),
              ));
        } catch (_) {
          interestContr.searchWordInAllSheets.value = '';
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    setPageTitle(interestContr.interestName.value, context);
    return Scaffold(
        drawer: homeDrawer(context),
        appBar: AppBar(
          title: ListTile(
            leading: al.helpIcon(context),
            title: Text(interestContr.interestName.value),
            trailing:
                Obx(() => Text(interestContr.searchWordInAllSheets.value)),
          ),
          backgroundColor: Colors.lightBlue,
          actions: [searchBar(context)],
        ),
        body: FutureBuilder<String>(
          future: interestContr.interestLoad(), // async work
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                  children: [
                    const Text('Loading sheets of interest:'),
                    Obx(() => Text(interestContr.interestName.value)),
                    const Text(' '),
                    Obx(() => Text(interestContr.loadedSheetName.value)),
                    const Text(' '),
                    const CircularProgressIndicator()
                  ],
                );

              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return detailBody();
                }
            }
          },
        ));
  }
}
