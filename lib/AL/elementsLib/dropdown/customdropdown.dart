import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu(
      {Key? key,
      required this.defaultValue,
      required this.values,
      required this.onItemSelected})
      : super(key: key);
  final dynamic Function(String? selectedValue) onItemSelected;
  final String defaultValue;
  final List<String> values;
  @override
  _CustomDropdownMenuState createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.all(5.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              items: widget.values.map((dropValue) {
                return DropdownMenuItem<String>(
                  value: dropValue,
                  child: Text(dropValue),
                );
              }).toList(),
              onChanged: (newDropdownValue) {
                setState(() {
                  dropdownValue = newDropdownValue!;
                });
                widget.onItemSelected(newDropdownValue);
              },
            ),
          ),
        ),
      ],
    );
  }
}
