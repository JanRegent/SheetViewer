import 'package:flutter/material.dart';
import '../constaints.dart';

class Charts extends StatelessWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= screenLg) {
      return Row(
        children: const [
          SizedBox(
            width: componentPadding,
          ),
        ],
      );
    }

    return Column(
      children: const [
        SizedBox(
          height: componentPadding,
        ),
      ],
    );
  }
}
