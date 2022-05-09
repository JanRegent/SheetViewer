import 'package:flutter/material.dart';
import 'news_list.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NewsList(),
    );
  }
}
