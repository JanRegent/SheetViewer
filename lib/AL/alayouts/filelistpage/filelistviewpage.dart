// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:sheetviewer/AL/alayouts/_getdata_layout/home_help.dart';
import 'package:sheetviewer/AL/elements/getrows/cards/filelistcard_all.dart';
import 'package:sheetviewer/AL/elements/getrows/cards/filelistcard_firstrows.dart';
import 'package:sheetviewer/AL/elements/getrows/cards/filelistcard_lastrows.dart';

import 'package:sheetviewer/AL/elementsLib/alib.dart';
import 'package:sheetviewer/BL/bl.dart';

// ignore: must_be_immutable
class FilelistviewPage extends StatelessWidget {
  final String cardType;
  const FilelistviewPage(this.cardType, {Key? key}) : super(key: key);

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
            itemCount: interestContr.fileListSheet.length,
            itemBuilder: (context, index) => Center(
                child: cardType == 'firstRows'
                    ? filelistCardFirstRows(
                        context, interestContr.fileListSheet[index], index)
                    : cardType == 'lastRows'
                        ? filelistCardLastRows(
                            context, interestContr.fileListSheet[index], index)
                        : cardType == 'allRows'
                            ? filelistCard(
                                context,
                                interestContr.fileListSheet[index],
                                index,
                              )
                            : filelistCard(
                                context,
                                interestContr.fileListSheet[index],
                                index,
                              ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: al.iconBack(context),
          title: const Text('fileListSheet.filelistTitle'),
          backgroundColor: Colors.lightBlue,
          actions: [
            ElevatedButton(
              child: const Icon(Icons.help),
              onPressed: () => helpToastShow(
                  "Click ob V icon to open cards bb", ToastGravity.CENTER_LEFT),
            ),
          ],
        ),
        body: detailBody());
  }
}
