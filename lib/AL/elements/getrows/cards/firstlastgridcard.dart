import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elements/getrows/firstlast/_firstlastrow.dart';

SizedBox firstlastGridCard(BuildContext context, int index, String sheetName,
    String fileId, String fileTitle) {
  return SizedBox(
      height: 200,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // ignore: prefer_const_constructors
        color: Color.fromARGB(255, 156, 223, 217),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          const Text('fileTitle todo'),
          firstLastRow(context, index, sheetName, fileId, fileTitle),
        ]),
      ));
}
