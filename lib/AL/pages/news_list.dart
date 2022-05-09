// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../_dashboard/constaints.dart';
import 'model.dart';
import '../_dashboard/widgets/news_item.dart';

final news = <News>[
  News(
    '5 minutes ago',
    'Lorem ipsum dolor sit amet, consectetur',
    'assets/imgs/shop.jpeg',
    'Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur',
  ),
  News(
    '5 minutes ago',
    'Lorem ipsum dolor sit amet, consectetur',
    'assets/imgs/shop.jpeg',
    'Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur',
  ),
  News(
    '5 minutes ago',
    'Lorem ipsum dolor sit amet, consectetur',
    'assets/imgs/shop.jpeg',
    'Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur',
  ),
  News(
    '5 minutes ago',
    'Lorem ipsum dolor sit amet, consectetur',
    'assets/imgs/shop.jpeg',
    'Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur',
  ),
  News(
    '5 minutes ago',
    'Lorem ipsum dolor sit amet, consectetur',
    'assets/imgs/shop.jpeg',
    'Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur',
  ),
  News(
    '5 minutes ago',
    'Lorem ipsum dolor sit amet, consectetur',
    'assets/imgs/shop.jpeg',
    'Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur',
  ),
  News(
    '5 minutes ago',
    'Lorem ipsum dolor sit amet, consectetur',
    'assets/imgs/shop.jpeg',
    'Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur',
  ),
  News(
    '5 minutes ago',
    'Lorem ipsum dolor sit amet, consectetur',
    'assets/imgs/shop.jpeg',
    'Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur',
  ),
  News(
    '5 minutes ago',
    'Lorem ipsum dolor sit amet, consectetur',
    'assets/imgs/shop.jpeg',
    'Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur',
  ),
];

class NewsList extends StatelessWidget {
  final bool showDesktop;
  const NewsList([this.showDesktop = false]);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryLight.withAlpha(100),
      padding: const EdgeInsets.symmetric(horizontal: componentPadding),
      child: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            height: topBarHeight,
            child: Row(
              children: [
                showDesktop ? const SizedBox.shrink() : const Text(' '),
                // IconButton(
                //     icon: const Icon(
                //       Icons.arrow_back,
                //     ),
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //   ),
                const Expanded(
                    child: Center(
                  child: Text(
                    'Latest News',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ))
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: news.map((e) => NewsItem(e)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
