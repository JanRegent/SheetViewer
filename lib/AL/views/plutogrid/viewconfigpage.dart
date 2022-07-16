import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:sheetviewer/AL/views/plutogrid/drawer.dart';
import 'package:sheetviewer/AL/views/plutogrid/filters.dart';

class ViewConfigPage extends StatefulWidget {
  final String fileId;
  final String sheetName;

  final List<PlutoColumn> plutoCols;

  const ViewConfigPage(this.fileId, this.sheetName, this.plutoCols, {Key? key})
      : super(key: key);

  @override
  _ViewConfigPageState createState() => _ViewConfigPageState();
}

class _ViewConfigPageState extends State<ViewConfigPage> {
  @override
  void initState() {
    super.initState();
  }

  List<TextEditingController> colsFilterContr = [];
  //------------------------------------------------------------------colsHeader

  Container colsHeaderRow() {
    List<Widget> wrow = [colsHeader()];
    for (var index = 0; index < plutoCols.length; index++) {
      if (plutoCols[index].hide) continue;
      wrow.add(
        ElevatedButton.icon(
            icon: const Icon(Icons.space_bar),
            label: Text(plutoCols[index].title),
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

  ElevatedButton colsHeader() {
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
    List<String> filteredCols = getFilteredColsTitles(gridAStateManager);
    for (var index = 0; index < plutoCols.length; index++) {
      colsFilterContr.add(TextEditingController());

      if (!filteredCols.contains(plutoCols[index].title.toLowerCase())) {
        continue;
      }

      colsFilterContr.last.text = index.toString();
      colsFilterContr[index].text =
          filteredColumnGetValue(gridAStateManager, plutoCols[index].title);
      wrow.add(Column(
        children: [
          ElevatedButton.icon(
              icon: const Icon(Icons.space_bar),
              label: Text(plutoCols[index].title),
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
    for (var index = 0; index < plutoCols.length; index++) {
      if (!plutoCols[index].frozen.isFrozen) continue;
      String freezeSide = 'start';
      if (plutoCols[index].frozen.isEnd) freezeSide = 'end';

      wrow.add(Column(
        children: [
          ElevatedButton.icon(
              icon: const Icon(Icons.space_bar),
              label: Text(plutoCols[index].title),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.red)))),
              onPressed: () {}),
          SizedBox(width: 120, height: 60, child: Text(freezeSide))
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
    for (var index = 0; index < plutoCols.length; index++) {
      if (plutoCols[index].sort.isNone) continue;
      String sort =
          plutoCols[index].sort.toString().replaceAll('PlutoColumnSort.', '');
      wrow.add(Column(
        children: [
          ElevatedButton.icon(
              icon: const Icon(Icons.space_bar),
              label: Text(plutoCols[index].title),
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

    for (var index = 0; index < plutoCols.length; index++) {
      if (plutoCols[index].hide) continue;
      wrow.add(
        ElevatedButton.icon(
            icon: const Icon(Icons.delete),
            label: Text(plutoCols[index].title),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.red)))),
            onPressed: () {}),
      );
    }

    //gridAStateManager.autoFitColumn(context, column).
    // for (var index = 0; index < plutoCols.length; index++) {
    //   if (plutoCols[index].title != 'Mise') continue;
    //   gridAStateManager.autoFitColumn(
    //       gridAStateManager.gridKey!.currentContext!, plutoCols[index]);
    //   wrow.add(Column(
    //     children: [
    //       ElevatedButton.icon(
    //           icon: const Icon(Icons.space_bar),
    //           label: Text(plutoCols[index].title),
    //           style: ButtonStyle(
    //               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                   RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(18.0),
    //                       side: const BorderSide(color: Colors.red)))),
    //           onPressed: () {}),
    //       SizedBox(width: 120, height: 60, child: Text(plutoCols[index].title))
    //     ],
    //   ));
    // }

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
