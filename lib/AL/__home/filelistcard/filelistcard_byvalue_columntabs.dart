import 'package:flutter/material.dart';
import 'package:sheetviewer/BL/sheet/sheet_config.dart';

class ByValueColumnsTabs extends StatefulWidget {
  final SheetConfig sheetConfig;
  const ByValueColumnsTabs(this.sheetConfig, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _ByValueColumnsTabsState createState() => _ByValueColumnsTabsState();
}

class _ByValueColumnsTabsState extends State<ByValueColumnsTabs>
    with SingleTickerProviderStateMixin {
  late final List<String> byValueColumns;

  late TabController tabController;
  TextStyle tabStyle = const TextStyle(fontSize: 16);

  @override
  void initState() {
    super.initState();
    byValueColumns = widget.sheetConfig.byValueColumns;
    tabController = TabController(
        length: byValueColumns.length, vsync: this, initialIndex: 0);
  }

  tabCreate() => CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            child: Scaffold(
              backgroundColor: Colors.white70,
              appBar: TabBar(
                indicatorColor: Colors.blue,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                controller: tabController,
                isScrollable: false,
                tabs: List<Widget>.generate(byValueColumns.length, (int index) {
                  return Tab(
                      child: Text(byValueColumns[index],
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15.0)));
                }),
              ),
              body: TabBarView(
                  controller: tabController,
                  children:
                      List<Widget>.generate(byValueColumns.length, (int index) {
                    return Text(byValueColumns[index]);
                  })),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: tabCreate());
  }

  tabName(String name) => Tab(
        child: Text(
          name,
          style: tabStyle,
        ),
      );
}
