import 'package:flutter/material.dart';

Future<List<String>> selectListByCheckoxes(
    BuildContext context, List<String> allItems, String listTitle) async {
  List selectedDynamic = [];
  await showDialog(
    context: context,
    builder: (context) {
      return _MyDialog(listTitle,
          allList: allItems,
          selectedList: selectedDynamic, onSelectedListListChanged: (items) {
        selectedDynamic = items;
      });
    },
  );

  List<String> selectedList = [];
  for (var element in selectedDynamic) {
    selectedList.add(element);
  }
  return selectedList;
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
  final ValueChanged<List> onSelectedListListChanged;
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<_MyDialog> {
  List _tempSelectedList = [];
  @override
  void initState() {
    _tempSelectedList = List.of(widget.selectedList);
    super.initState();
  }

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
                    widget.onSelectedListListChanged(_tempSelectedList);

                    Navigator.pop(context, _tempSelectedList);
                  },
                  icon: const Icon(Icons.check),
                ),
              ],
            ),
            trailing: IconButton(
              tooltip: 'OK, confirm selection',
              onPressed: () {
                _tempSelectedList = widget.allList;
                widget.onSelectedListListChanged(_tempSelectedList);
                setState(() {});
              },
              icon: const Icon(Icons.select_all),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.allList.length,
              itemBuilder: (BuildContext context, int index) {
                final cityName = widget.allList[index];
                return CheckboxListTile(
                  title: Text(cityName),
                  value: _tempSelectedList.contains(cityName),
                  onChanged: (bool? value) {
                    if (value != null && value) {
                      if (!_tempSelectedList.contains(cityName)) {
                        setState(() {
                          _tempSelectedList.add(cityName);
                        });
                      }
                    } else {
                      if (_tempSelectedList.contains(cityName)) {
                        setState(
                          () {
                            // _tempSelectedCities
                            //     .removeWhere((String city) => city == cityName);
                          },
                        );
                      }
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
