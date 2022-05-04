// ignore_for_file: unnecessary_null_comparison

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:chucker_flutter_ui/chucker_flutter_ui.dart';
import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/__home/homepage.dart';
//import 'package:sheetviewer/AL/elementsLib/infodialogs/okdialog.dart';
import 'package:sheetviewer/AL/elementsLib/infodialogs/snack.dart';
import 'package:sheetviewer/BL/actionSheet/getsheet.dart';
import 'package:sheetviewer/BL/lib/blglobal.dart';
import 'package:sheetviewer/DL/models/sheetview.dart';

class GetDataInterestsApp extends StatelessWidget {
  const GetDataInterestsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [ChuckerFlutter.navigatorObserver],
      home: const Scaffold(
          body: GetDataInterestsPage()), // ChuckerFlutter.chuckerButton
    );
    // return const MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: Scaffold(
    //       body: GetDataInterestsPage(),
    //     ));
  }
}

/// The home page of the application which hosts the datagrid.
class GetDataInterestsPage extends StatefulWidget {
  const GetDataInterestsPage({Key? key}) : super(key: key);

  @override
  _GetDataInterestsPageState createState() => _GetDataInterestsPageState();
}

class _GetDataInterestsPageState extends State<GetDataInterestsPage> {
  @override
  void initState() {
    super.initState();
  }

  SheetView sheetView = SheetView()..aStatus = 'info:empty';

  List<dynamic> interestsDynamic = [];
  List<String> interests = [];
  Future<String> getData(BuildContext context) async {
    try {
      List<dynamic> interestList = await localDb.read('interestList', List);
      if (interestList.isEmpty) {
        Map responseData = await getSheet(
            'https://docs.google.com/spreadsheets/d/1hvRQ69fal9ySZIXoKW4ElJwEJQO1p5eNpM82txhw6Uo/edit#gid=1211959017',
            'interestList');
        if (responseData.isNotEmpty) {
          await localDb.update('interestList', responseData['rows']);
        }
      }
    } catch (_) {}

    try {
      interestsDynamic = await localDb.read('interestList', List);
      for (var i = 0; i < interestsDynamic.length; i++) {
        String interestName = interestsDynamic[i]['interestName'];
        if (interests.contains(interestName)) continue;
        interests.add(interestName);
      }
      return 'ok';
    } catch (e) {
      //okdialog1(context);
      infoSnack(
          context, 'Interests list NOT ready', AnimatedSnackBarType.error);
      return 'err: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<String>(
      future: getData(context), // async work
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Column(
              children: const [
                Text('Loading interests....'),
                CircularProgressIndicator()
              ],
            );

          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return HomeScreen(interestsDynamic, interests);
            }
        }
      },
    ));
  }
}
