import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/views/plutogrid/drawer.dart';
import 'package:sheetviewer/AL/views/plutogrid/filters.dart';

class ViewHelperPage extends StatefulWidget {
  final String fileId;
  final String sheetName;

  const ViewHelperPage(this.fileId, this.sheetName, {Key? key})
      : super(key: key);

  @override
  _ViewHelperPageState createState() => _ViewHelperPageState();
}

class _ViewHelperPageState extends State<ViewHelperPage> {
  @override
  void initState() {
    viewHelper.fileId = widget.fileId;
    viewHelper.sheetName = widget.sheetName;
    super.initState();
  }

  List<TextEditingController> colsFilterContr = [];
  //------------------------------------------------------------------colsHeader

  Container colsHeaderRow() {
    List<Widget> wrow = [colsHeader1()];
    for (var index = 0; index < viewHelper.plutoCols.length; index++) {
      if (viewHelper.plutoCols[index].hide) continue;
      wrow.add(
        ElevatedButton.icon(
            icon: const Icon(Icons.space_bar),
            label: Text(viewHelper.plutoCols[index].title),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.red)))),
            onPressed: () {}),
      );
    }

    return Container(
        margin: const EdgeInsets.all(5.0),
        height: 70.0,
        width: 333.0,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: wrow,
        ));
  }

  ElevatedButton colsHeader1() {
    return ElevatedButton.icon(
      icon: const Icon(Icons.select_all),
      label: const Text(
        'ColsHeader',
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white10),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(color: Colors.red)))),
      onPressed: () async {},
    );
  }

  //------------------------------------------------------------------colsFilter

  Container colsFilter() {
    ElevatedButton colsFilter1() {
      return ElevatedButton.icon(
        icon: const Icon(Icons.select_all),
        label: const Text(
          'ColsFilter   ',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white10),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.red)))),
        onPressed: () async {},
      );
    }

    List<Widget> wrow = [colsFilter1()];
    List<String> filteredCols =
        getFilteredColsTitles(viewHelper.gridAStateManager);
    for (var index = 0; index < viewHelper.plutoCols.length; index++) {
      colsFilterContr.add(TextEditingController());

      if (!filteredCols
          .contains(viewHelper.plutoCols[index].title.toLowerCase())) {
        continue;
      }

      colsFilterContr.last.text = index.toString();
      colsFilterContr[index].text = filteredColumnGetValue(
          viewHelper.gridAStateManager, viewHelper.plutoCols[index].title);
      wrow.add(Column(
        children: [
          ElevatedButton.icon(
              icon: const Icon(Icons.space_bar),
              label: Text(viewHelper.plutoCols[index].title),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.red)))),
              onPressed: () {}),
          SizedBox(
              width: 120,
              height: 60,
              child: TextField(
                controller: colsFilterContr[index],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'contains',
                ),
              ))
        ],
      ));
    }

    return Container(
        margin: const EdgeInsets.all(5.0),
        height: 88.0,
        width: 333.0,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: wrow,
        ));
  }

  //------------------------------------------------------------------freezeTo

  Container freezeTo() {
    ElevatedButton freezeTo1() {
      return ElevatedButton.icon(
        icon: const Icon(Icons.select_all),
        label: const Text(
          'FrezeTo    ',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white10),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.red)))),
        onPressed: () async {},
      );
    }

    List<Widget> wrow = [freezeTo1()];

    for (var element in viewHelper.freezeToListDynamic()) {
      wrow.add(Column(
        children: [
          ElevatedButton.icon(
              icon: const Icon(Icons.space_bar),
              label: Text(element['title']),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.red)))),
              onPressed: () {}),
          SizedBox(width: 120, height: 60, child: Text(element['side']))
        ],
      ));
    }

    return Container(
        margin: const EdgeInsets.all(5.0),
        height: 88.0,
        width: 333.0,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: wrow,
        ));
  }

  //------------------------------------------------------------------sort

  Container sort() {
    ElevatedButton sort1() {
      return ElevatedButton.icon(
        icon: const Icon(Icons.select_all),
        label: const Text(
          'Order      ',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white10),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.red)))),
        onPressed: () async {},
      );
    }

    List<Widget> wrow = [sort1()];
    for (var index = 0; index < viewHelper.plutoCols.length; index++) {
      if (viewHelper.plutoCols[index].sort.isNone) continue;
      String sort = viewHelper.plutoCols[index].sort
          .toString()
          .replaceAll('PlutoColumnSort.', '');
      wrow.add(Column(
        children: [
          ElevatedButton.icon(
              icon: const Icon(Icons.space_bar),
              label: Text(viewHelper.plutoCols[index].title),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.red)))),
              onPressed: () {}),
          SizedBox(width: 120, height: 60, child: Text(sort))
        ],
      ));
    }

    return Container(
        margin: const EdgeInsets.all(5.0),
        height: 88.0,
        width: 333.0,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: wrow,
        ));
  }

//------------------------------------------------------------------autoFit

  Container autoFit() {
    ElevatedButton autoFit1() {
      return ElevatedButton.icon(
        icon: const Icon(Icons.select_all),
        label: const Text(
          'Auto fit   ',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white10),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.red)))),
        onPressed: () async {},
      );
    }

    // for (var col in gridAStateManager.columns) {
    //   gridAStateManager.autoFitColumn(
    //       gridAStateManager.gridKey!.currentContext!, col);
    // }
    List<Widget> wrow = [autoFit1()];

    for (var index = 0; index < viewHelper.plutoCols.length; index++) {
      if (viewHelper.plutoCols[index].hide) continue;
      wrow.add(
        ElevatedButton.icon(
            icon: const Icon(Icons.delete),
            label: Text(viewHelper.plutoCols[index].title),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.red)))),
            onPressed: () {}),
      );
    }

    return Container(
        margin: const EdgeInsets.all(5.0),
        height: 88.0,
        width: 333.0,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: wrow,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('View config page'),
          actions: [viewHelper.viewConfigSave()],
        ),
        body: ListView(shrinkWrap: true, children: [
          colsHeaderRow(),
          colsFilter(),
          freezeTo(),
          sort(),
          autoFit()
        ]));
  }
}
