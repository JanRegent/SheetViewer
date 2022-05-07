import 'package:flutter/material.dart';

import '../layout/main_layout.dart';
import '../components/order_table.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        //StatusList(),
        //Charts(),
        // SizedBox(
        //   height: componentPadding,
        // ),
        OrderTable(),
      ],
    ));
  }
}
