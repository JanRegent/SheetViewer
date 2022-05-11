import '../models/booker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/bookshelf.dart';
import '../widgets/zoom_menu.dart';

class Liked extends StatelessWidget {
  const Liked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink,
        leading: const ZoomMenu(),
        title: const Text("Liked"),
      ),
      body: Column(
        children: [
          Expanded(
            child: MasonryGridView.count(
              // ignore: non_constant_identifier_names
              itemCount: bookshelf.where((Book) => Book.like == true).length,
              itemBuilder: (context, index) {
                List likedbooks =
                    // ignore: non_constant_identifier_names
                    bookshelf.where((Book) => Book.like == true).toList();
                return Booker(books: likedbooks[index]);
              },
              crossAxisCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
