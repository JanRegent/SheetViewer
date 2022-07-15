import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/elementsLib/selectList/selectlistbycheckoxes.dart';

import 'package:sheetviewer/AL/views/plutogrid/drawer.dart';
import 'package:sheetviewer/BL/bl.dart';

class ViewVonfigBuilder extends StatefulWidget {
  final String fileId;
  final String sheetName;
  const ViewVonfigBuilder(this.fileId, this.sheetName, {Key? key})
      : super(key: key);

  @override
  _ViewVonfigBuilderState createState() => _ViewVonfigBuilderState();
}

class _ViewVonfigBuilderState extends State<ViewVonfigBuilder> {
  @override
  void initState() {
    super.initState();
    colsBuilder.addAll([
      'aaaaaaaaaa',
      'bbbbbbbbbbbbbbbbbbbb',
      'ccccccccccccccccccc',
      'dddddddddddddddddddd',
      'eeeeeeeeeeeeeeeeeeeeeeeee',
      'fffffffffffffffffffffff'
    ]);
  }

  void setStateFunc() {
    setState(() {});
  }

  Container colsHeaderRow() {
    List<Widget> wrow = [colsHeader()];
    for (var index = 0; index < colsBuilder.length; index++) {
      wrow.add(
        ElevatedButton.icon(
            icon: const Icon(Icons.delete),
            label: Text(colsBuilder[index]),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.red)))),
            onPressed: () {
              colsBuilder.removeAt(index);
              setState(() {});
            }),
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
      onPressed: () async {
        List<String> cols =
            await sheetRowsDb.readCols(widget.fileId, widget.sheetName);
        if (colsBuilder == cols) {
          return;
        }

        List<String> result =
            await selectListByCheckoxes(context, cols, 'Columns select');

        if (result.isEmpty) {
          //reset to all cols
          colsBuilder = cols;
        } else {
          colsBuilder = result;
        }
        setStateFunc();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('View config builder'),
        ),
        body: ListView(shrinkWrap: true, children: [colsHeaderRow()]));
  }
}
