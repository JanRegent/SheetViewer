import 'package:flutter/material.dart';

class ByCondSelect1runPane extends StatefulWidget {
  const ByCondSelect1runPane({Key? key}) : super(key: key);

  @override
  _ByCondSelect1runPaneState createState() => _ByCondSelect1runPaneState();
}

class _ByCondSelect1runPaneState extends State<ByCondSelect1runPane> {
  final List<String> _students = [
    'Gianluca',
    'Lindsay',
    'Leah',
    'U',
    'Marco',
    'Liam',
    'Harrison',
    'Charise',
    'Ting Wei',
    'Ryan',
    'Deena',
    'Xiao Yuan',
    'Benjamin',
    'Calvin',
    'Claudia',
    'Kok Hao',
    'Michalina',
    'Ruby',
    'Rachel',
    'Nadir',
    'Dan',
    'Raaid',
    'Nadia',
    'Matilda',
    'Lloyd',
    'Arielle',
    'Jun',
    'Desmond',
    'Miah',
    'Aiden',
    'Kira',
    'Nathan',
    'Thung Thung',
    'Miki',
    'Yongyou',
    'Brogan',
    'Zai Chern',
    'Gondini',
    'Ella',
    'Germaine'
  ];
  String textData = "";
  int current = 0;
  bool init = true;

  @override
  void initState() {
    addName();
    super.initState();
  }

  addName() {
    if (init) {
      for (int i = 0; i < _students.length; i++) {
        textData += _students[i] + "   ";
      }
    } else {
      textData += _students[current] + "   ";
      if (current > _students.length) {
        current = 0;
      } else {
        current++;
      }
    }
    setState(() {});
  }

  ListView selects1List() {
    return ListView.builder(
      itemCount: _students.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            //                    <-- BoxDecoration
            border: Border(bottom: BorderSide()),
          ),
          child: ListTile(
            title: Text(_students[index]),
          ),
        );
      },
    );
  }

  Widget twooPanes() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 9,
          child: selects1List(),
        ),
        Expanded(
          flex: 1,
          child: ButtonBar(
            overflowDirection: VerticalDirection.down,
            children: <Widget>[
              Column(
                children: [
                  ElevatedButton(
                    child: const Icon(Icons.run_circle_outlined),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
              onPressed: () {
                addName();
              },
              child: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
        body: twooPanes());
  }
}
