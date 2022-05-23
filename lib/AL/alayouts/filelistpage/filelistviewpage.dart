// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/elementsLib/alib.dart';
import 'package:sheetviewer/BL/bl.dart';

import '../../elements/getrows/cards/_filelistcard.dart';
import 'drawer_filelist.dart';

// ignore: must_be_immutable
class FilelistviewPage extends StatelessWidget {
  final String cardType;

  const FilelistviewPage(this.cardType, {Key? key}) : super(key: key);
  void setStateFunc() {}

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
                child: filelistCard(cardType, context,
                    interestContr.fileListSheet[index], index)
                // cardType == 'firstRows'
                //     ? filelistCardFirstRows(
                //         context, interestContr.fileListSheet[index], index)
                //     : cardType == 'lastRows'
                //         ? filelistCardLastRows(
                //             context, interestContr.fileListSheet[index], index)
                //         : cardType == 'allRows'
                //             ? filelistCard(
                //                 context,
                //                 interestContr.fileListSheet[index],
                //                 index,
                //               )
                //             : filelistCard(
                //                 context,
                //                 interestContr.fileListSheet[index],
                //                 index,
                //               )

                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: filelistDrawer(context, setStateFunc),
        appBar: AppBar(
          leading: al.iconBack(context),
          title: ListTile(
            leading: al.helpIcon(context),
            title: Text(interestContr.interestName.value),
          ),
          backgroundColor: Colors.lightBlue,
        ),
        body: detailBody());
  }
}
