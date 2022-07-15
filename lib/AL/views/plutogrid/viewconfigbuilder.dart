import 'package:flutter/material.dart';

import 'package:sheetviewer/AL/views/plutogrid/drawer.dart';

class ViewVonfigBuilder extends StatefulWidget {
  const ViewVonfigBuilder({Key? key}) : super(key: key);

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
      wrow.add(ElevatedButton(
          onPressed: () {
            print(colsBuilder[index]);
          },
          child: Text(colsBuilder[index]),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.red))))));
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
    return ElevatedButton(
        onPressed: () {},
        child: const Text(
          'ColsHeader',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white10),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.red)))));
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
