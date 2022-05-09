import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/pages/topbar.dart';
import '../../pages/news_list.dart';
import 'sidebar.dart';
import '../../pages/topbar.dart';

import '../constaints.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;
  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final _showDesktop = _size.width >= screenXxl;
    return Scaffold(
        body: SafeArea(
      child: Row(
        children: [
          const SideBar(),
          Expanded(
            child: Column(
              children: [
                TopBar(_showDesktop),
                Expanded(
                    child: SingleChildScrollView(
                        child: Padding(
                  child: child,
                  padding: const EdgeInsets.all(componentPadding),
                )))
              ],
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: _showDesktop ? newsPageWidth : 0,
            child: NewsList(_showDesktop),
          )
        ],
      ),
    ));
  }
}
