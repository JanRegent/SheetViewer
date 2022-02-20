// ignore_for_file: file_names

import 'package:flutter/material.dart';

///
///https://medium.com/@pankajdas09/how-to-update-checkbox-and-return-value-from-dialog-in-flutter-814fa69d2046
///
Future<String> selectListByRadiobuttons(
    BuildContext context, List<String> allItems, String listTitle) async {
  String selected = '10';
  await showDialog(
    context: context,
    builder: (context) {
      return _MyDialog(listTitle, allList: allItems, selectedList: const [],
          onSelectedListListChanged: (items) {
        selected = items;
      });
    },
  );

  return selected;
}

class _MyDialog extends StatefulWidget {
  final String listTitle;
  const _MyDialog(
    this.listTitle, {
    required this.allList,
    required this.selectedList,
    required this.onSelectedListListChanged,
  });
  final List<String> allList;
  final List selectedList;
  final ValueChanged<String> onSelectedListListChanged;
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<_MyDialog> {
  @override
  void initState() {
    super.initState();
  }

  String selectedValue = '';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          ListTile(
            tileColor: Colors.blue[100],
            leading: Text(widget.listTitle),
            title: Row(
              children: [
                IconButton(
                  tooltip: 'Cancel selection',
                  onPressed: () {
                    Navigator.pop(context, []);
                  },
                  icon: const Icon(Icons.cancel),
                ),
                IconButton(
                  tooltip: 'OK, confirm selection',
                  onPressed: () {
                    print('qq $selectedValue');
                    Navigator.pop(context, selectedValue);
                  },
                  icon: const Icon(Icons.check),
                ),
              ],
            ),
            // trailing: IconButton(
            //   tooltip: 'OK, confirm selection',
            //   onPressed: () {
            //   },
            //   icon: const Icon(Icons.select_all),
            // ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.allList.length,
              itemBuilder: (BuildContext context, int index) {
                //final cityName = widget.allList[index];
                return RadioListTile(
                  value: 0,
                  groupValue: index,
                  onChanged: (value) {
                    selectedValue = widget.allList[index];
                  },
                  title: Text(widget.allList[index]),
                  subtitle: const Text(" "),
                  secondary: const Icon(Icons.sd_storage),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
