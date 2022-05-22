import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:sheetviewer/BL/bl.dart';
import 'package:sheetviewer/DL/getdata_models.dart';
import 'package:sheetviewer/DL/isardb/sheetview.dart';

class GetPlanPage extends StatefulWidget {
  final List<List<int>> getPlan;
  final String fileId;
  final String sheetName;
  final String action;
  const GetPlanPage(this.getPlan, this.fileId, this.sheetName, this.action,
      {Key? key})
      : super(key: key);

  @override
  State<GetPlanPage> createState() => _GetPlanPageState();
}

class _GetPlanPageState extends State<GetPlanPage> {
  String appender = '';
  @override
  void initState() {
    super.initState();
    appender = widget.getPlan.toString() + '\n';
  }

  void append(String value) {
    appender += '\n' + value;
    setState(() {});
  }

  // This is used to conditionally display a loading indicator
  bool _isLoading = false;

  Future<int> _futureOne() async {
    append('Start fetching all rows');
    await Future.delayed(const Duration(seconds: 1));
    return 1;
  }

  SheetView sheetView = SheetView();

  Future<int> _futureTwo() async {
    append('rows: ' + widget.getPlan[0].toString());
    sheetView = await sheetViewGetPlanPart(widget.fileId, widget.sheetName,
        'getRowsFromTo', widget.getPlan[0][0], widget.getPlan[0][1]);
    print(sheetView.rows.length);
    print('-/////////////////////');
    for (var i = 1; i < widget.getPlan.length; i++) {
      append('rows: ' + widget.getPlan[i].toString());
      SheetView part = await sheetViewGetPlanPart(
          widget.fileId,
          widget.sheetName,
          'getRowsFromTo',
          widget.getPlan[i][0],
          widget.getPlan[i][1]);

      print(part.rows.length);
      sheetView.rows.addAll(part.rows);
      print(sheetView.rows.length);
      print('----------------------------');
    }

    String queryStringKey = queryStringAll(widget.fileId, widget.sheetName);
    await sheetsDb.updateSheetsFromResponse(sheetView, queryStringKey);
    print('************************');
    print(sheetView.rows.length);
    print(queryStringKey);
    return 2;
  }

  void _fireFutureGroup() async {
    setState(() {
      _isLoading = true;
    });

    final FutureGroup<int> _futureGroup = FutureGroup<int>();

    // Adding futures
    _futureGroup.add(_futureOne());
    _futureGroup.add(_futureTwo());

    // Signals that the adding process is done
    _futureGroup.close();

    // Firing the future from the FutureGroup.future property
    final List<int> _results = await _futureGroup.future;
    debugPrint(_results.toString());

    // Re-render UI
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KindaCode.com'),
      ),
      body: Column(
        children: [
          Text(appender),
          _isLoading ? const CircularProgressIndicator() : const Text('.')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fireFutureGroup,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
