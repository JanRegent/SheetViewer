import 'package:flutter/material.dart';

import '../model.dart';

final List<BussinessStatus> statusList = [
  BussinessStatus('Total Sales', '1123456 \$', Icons.show_chart_outlined),
  BussinessStatus('Total Profit', '11234 \$', Icons.attach_money_outlined),
  BussinessStatus('Orders', '1236', Icons.shopping_cart_outlined),
  BussinessStatus('Customers', '11234', Icons.people_outline_outlined),
];

class StatusList extends StatelessWidget {
  const StatusList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final Size _size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          backgroundColor: Colors.amber,
          title: Text('Kindacode.com'),
          expandedHeight: 30,
          collapsedHeight: 150,
        ),
        const SliverAppBar(
          backgroundColor: Colors.green,
          title: Text('Have a nice day'),
          floating: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                margin: const EdgeInsets.all(15),
                child: Container(
                  color: Colors.blue[100 * (index % 9 + 1)],
                  height: 80,
                  alignment: Alignment.center,
                  child: Text(
                    "Item $index",
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              );
            },
            childCount: 1000, // 1000 list items
          ),
        ),
      ],
    );
    // Column(
    //   children: [
    //     Row(
    //       children: const [
    //         Text(
    //           'Weekly',
    //           style: TextStyle(
    //             fontSize: 16,
    //           ),
    //         ),
    //         SizedBox(width: 14),
    //         Text('Monthly',
    //             style: TextStyle(
    //               fontSize: 16,
    //               fontWeight: FontWeight.bold,
    //             )),
    //         SizedBox(
    //           width: 14,
    //         ),
    //         Text('Yearly',
    //             style: TextStyle(
    //               fontSize: 16,
    //             )),
    //       ],
    //     ),
    //     const SizedBox(
    //       height: componentPadding,
    //     ),
    //     GridView.custom(
    //       gridDelegate: SliverQuiltedGridDelegate(
    //         crossAxisCount: 4,
    //         mainAxisSpacing: 4,
    //         crossAxisSpacing: 4,
    //         repeatPattern: QuiltedGridRepeatPattern.inverted,
    //         pattern: const[
    //           QuiltedGridTile(2, 2),
    //           QuiltedGridTile(1, 1),
    //           QuiltedGridTile(1, 1),
    //           QuiltedGridTile(1, 2),
    //         ],
    //       ),
    //       childrenDelegate: SliverChildBuilderDelegate(
    //         (context, index) => Tile(index: index),
    //       ),
    //     ),
    //     // StaggeredGridView.countBuilder(
    //     //     physics: const NeverScrollableScrollPhysics(),
    //     //     shrinkWrap: true,
    //     //     crossAxisCount: 4,
    //     //     mainAxisSpacing: componentPadding,
    //     //     crossAxisSpacing: componentPadding,
    //     //     itemCount: statusList.length,
    //     //     itemBuilder: (context, index) => StatusCard(statusList[index]),

    //     //     staggeredTileBuilder: (index) {
    //     //       if (_size.width > screenXxl) return const StaggeredTile.fit(1);
    //     //       if (_size.width > screenSm) return const StaggeredTile.fit(2);
    //     //       return const StaggeredTile.fit(4);
    //     //     })
    //   ],
    // );
  }
}
