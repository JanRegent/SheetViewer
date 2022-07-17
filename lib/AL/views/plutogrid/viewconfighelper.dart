import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:sheetviewer/AL/views/plutogrid/drawer.dart';
import 'package:sheetviewer/AL/views/plutogrid/filters.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/isardb/viewconfig.dart';

class ViewConfigHelper extends StatefulWidget {
  final String fileId;
  final String sheetName;

  final List<PlutoColumn> plutoCols;

  const ViewConfigHelper(this.fileId, this.sheetName, this.plutoCols,
      {Key? key})
      : super(key: key);

  @override
  _ViewConfigHelperState createState() => _ViewConfigHelperState();
}

class _ViewConfigHelperState extends State<ViewConfigHelper> {
  @override
  void initState() {
    super.initState();
  }

  List<TextEditingController> colsFilterContr = [];
  //------------------------------------------------------------------colsHeader
  List<String> getColsHeader() {
    List<String> colsHeader = [];
    for (var index = 0; index < plutoCols.length; index++) {
      if (plutoCols[index].hide) continue;

      colsHeader.add(plutoCols[index].title);
    }
    return colsHeader;
  }

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

  List<String> getFilteredList() {
    List<String> filtersList = [];
    for (var index = 0; index < plutoCols.length; index++) {
      String value =
          filteredColumnGetValue(gridAStateManager, plutoCols[index].title);
      if (value.isEmpty) continue;
      filtersList.add({'${plutoCols[index].title}: $value'}.toString());
    }
    return filtersList;
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

  List<String> getFreezeToList() {
    List<String> freezeToList = [];
    for (var index = 0; index < plutoCols.length; index++) {
      if (!plutoCols[index].frozen.isFrozen) continue;
      String freezeSide = 'start';
      if (plutoCols[index].frozen.isEnd) freezeSide = 'end';
      freezeToList.add({'${plutoCols[index].title}: $freezeSide'}.toString());
    }
    return freezeToList;
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

  String getSort() {
    Map sortPar = {};
    for (var index = 0; index < plutoCols.length; index++) {
      if (plutoCols[index].sort.isNone) continue;
      String sort =
          plutoCols[index].sort.toString().replaceAll('PlutoColumnSort.', '');
      sortPar[plutoCols[index].title] = sort;
      break;
    }
    return sortPar.toString();
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

  List<String> getAutoFitList() {
    List<String> autofitList = [];
    for (var index = 0; index < plutoCols.length; index++) {
      if (plutoCols[index].hide) continue;

      autofitList.add(plutoCols[index].title);
    }
    return autofitList;
  }

  //---------------------------------------------------------------saveLoad
  IconButton viewConfigSave() {
    return IconButton(
        icon: const Icon(Icons.save),
        onPressed: () async {
          ViewConfig viewConfig = ViewConfig()
            ..aSheetName = widget.sheetName
            ..zfileId = widget.fileId
            ..colsHeader = getColsHeader()
            ..colsFilter = getFilteredList()
            ..freezeTo = getFreezeToList()
            ..sort = getSort()
            ..autoFit = getAutoFitList();

          await viewConfigsDb.update(viewConfig);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('View config page'),
          actions: [viewConfigSave()],
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
