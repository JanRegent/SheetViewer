import 'package:flutter/material.dart';

class SelectByRadiobuttonsPage extends StatefulWidget {
  final String title;
  final List<String> values;
  const SelectByRadiobuttonsPage(this.title, this.values, {Key? key})
      : super(key: key);

  @override
  _SelectByRadiobuttonsPageState createState() =>
      _SelectByRadiobuttonsPageState();
}

class _SelectByRadiobuttonsPageState extends State<SelectByRadiobuttonsPage> {
  // The group value
  String _result = '';

  ElevatedButton okButton() {
    return ElevatedButton(
      child: const Icon(Icons.check),
      onPressed: () async {
        Navigator.pop(context, _result);
      },
    );
  }

  List<RadioListTile> radioButtons() {
    List<RadioListTile> buttons = [];
    for (var i = 0; i < widget.values.length; i++) {
      buttons.add(RadioListTile(
          title: Text(widget.values[i]),
          value: widget.values[i],
          groupValue: _result,
          onChanged: (value) {
            setState(() {
              _result = value.toString();
            });
          }));
    }
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Text(
            widget.title + ': ' + _result,
          ),
          _result.isNotEmpty ? okButton() : const Text(' ')
        ],
      )),
      body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: radioButtons())),
    );
  }
}
