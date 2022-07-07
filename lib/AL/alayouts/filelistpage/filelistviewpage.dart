// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/elementsLib/alib.dart';
import 'package:sheetviewer/BL/bl.dart';

import '../../elements/getrows/cards/_filelistcard.dart';
import '../../elements/getrows/cards/searchbywords.dart';

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
            itemCount: interestContr.interestFilelist.length,
            itemBuilder: (context, index) => Center(
                child: cardType == 'byRows'
                    ? filelistCard(cardType, context,
                        interestContr.interestFilelist[index], index)
                    : cardType == 'By words'
                        ? searchByWordsCard(cardType, context,
                            interestContr.interestFilelist[index], index, 'ego')
                        : const Text('not implemented'))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: al.iconBack(context),
          title: ListTile(
            leading: al.helpIcon(context),
            title: Text(interestContr.interestName.value),
          ),
          backgroundColor: Colors.lightBlue,
        ),
        body: FutureBuilder<String>(
          future: interestContr.getInterestFilelist(), // async work
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                  children: const [
                    Text('Loading....'),
                    CircularProgressIndicator()
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
