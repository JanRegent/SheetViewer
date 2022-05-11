import 'package:flutter/material.dart';

import '../widgets/zoom_menu.dart';

class RateUs extends StatelessWidget {
  const RateUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        leading: const ZoomMenu(),
        title: const Text("Rate Us"),
      ),
    );
  }
}
