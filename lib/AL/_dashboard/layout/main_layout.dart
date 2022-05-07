import 'package:flutter/material.dart';
import '../components/news_list.dart';
import '../layout/sidebar.dart';
import '../layout/topbar.dart';

import '../constaints.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({Key? key, required this.child}) : super(key: key);

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
