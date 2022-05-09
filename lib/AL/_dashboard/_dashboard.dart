import 'package:flutter/material.dart';
import 'package:sheetviewer/AL/_dashboard/interests/controlers_interests.dart';
import 'package:sheetviewer/AL/_dashboard/pages/news.dart';

import 'components/order_table.dart';
import 'pages/main_layout.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<Dashboard> {
  _DashboardPageState();

  @override
  Widget build(BuildContext context) {
    dashboardPages.clear();
    switch (dashboardPageCurrent.value) {
      case 'LastNew1Page':
        dashboardPages.add(const NewsPage());
        break;
      default:
        dashboardPages.add(const OrderTable());
    }
    setState(() {});
    return DashboardLayout(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: dashboardPages,
    ));
  }
}
