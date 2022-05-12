import 'package:flutter/material.dart';
import 'package:sheetviewer/DL/isardb/sheetviewconfig.dart';

class ByCondSelect1runPane extends StatefulWidget {
  final SheetViewConfig sheetConfig;
  const ByCondSelect1runPane(this.sheetConfig, {Key? key}) : super(key: key);

  @override
  _ByCondSelect1runPaneState createState() => _ByCondSelect1runPaneState();
}

class _ByCondSelect1runPaneState extends State<ByCondSelect1runPane> {
  @override
  void initState() {
    super.initState();
  }

  ListView selects1List() {
    return ListView.builder(
      itemCount: widget.sheetConfig.selects1.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            //                    <-- BoxDecoration
            border: Border(bottom: BorderSide()),
          ),
          child: ListTile(
            title: Text(widget.sheetConfig.selects1[index]),
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
              onPressed: () {},
              child: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
        body: twooPanes());
  }
}
