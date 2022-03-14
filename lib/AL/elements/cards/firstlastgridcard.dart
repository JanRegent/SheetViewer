import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elements/getrows/firstLast/_firstlastrow.dart';

SizedBox firstlastGridCard(
    BuildContext context, Function setStateFunc, Map fileListSheet, int index) {
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
          Text(fileListSheet['rows'][index]['fileTitle']),
          firstLastRow(context, setStateFunc, fileListSheet, index),
        ]),
      ));
}