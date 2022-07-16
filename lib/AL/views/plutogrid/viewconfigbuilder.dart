import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:sheetviewer/AL/views/plutogrid/drawer.dart';
import 'package:sheetviewer/AL/views/plutogrid/filters.dart';

class ViewVonfigBuilder extends StatefulWidget {
  final String fileId;
  final String sheetName;

  final List<PlutoColumn> plutoCols;

  const ViewVonfigBuilder(this.fileId, this.sheetName, this.plutoCols,
      {Key? key})
      : super(key: key);

  @override
  _ViewVonfigBuilderState createState() => _ViewVonfigBuilderState();
}

class _ViewVonfigBuilderState extends State<ViewVonfigBuilder> {
  @override
  void initState() {
    super.initState();
  }

  void setStateFunc() {
    setState(() {});
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
    List<Widget> wrow = [colsFilter1()];
    List<PlutoColumn> filteredCols = getFilteredColumns(gridAStateManager);

    for (var index = 0; index < filteredCols.length; index++) {
      colsFilterContr.add(TextEditingController());
      colsFilterContr.last.text = index.toString();
      colsFilterContr[index].text =
          filteredColumnGetValue(gridAStateManager, filteredCols[index].title);
      wrow.add(Column(
        children: [
          ElevatedButton.icon(
              icon: const Icon(Icons.space_bar),
              label: Text(filteredCols[index].title),
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

  ElevatedButton colsFilter1() {
    return ElevatedButton.icon(
      icon: const Icon(Icons.select_all),
      label: const Text(
        'ColsFilter',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('View config builder'),
        ),
        body: ListView(
            shrinkWrap: true, children: [colsHeaderRow(), colsFilter()]));
  }
}
