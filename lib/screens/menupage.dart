import 'package:flutter/material.dart';

class MenuItems {
  static const books = MenuItem("Books", Icons.book);
  static const liked = MenuItem("Liked", Icons.favorite);
  static const write = MenuItem("Publish", Icons.edit_note);
  static const help = MenuItem("Help", Icons.help);
  // ignore: constant_identifier_names
  static const rate_us = MenuItem("Rate Us", Icons.star_border);

  static const all = <MenuItem>[books, liked, write, help, rate_us];
}

class MenuItem {
  final String title;
  final IconData icon;

  const MenuItem(this.title, this.icon);
}

class MenuPage extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;
  const MenuPage({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Spacer(
              flex: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.height * 0.1,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/fem1.jpg"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.15,
                    child: const Center(
                      child: Text(
                        'Asa Adegbite',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ...MenuItems.all.map(buildMenuItem).toList(),
            const Spacer(
              flex: 9,
            ),
          ],
        )),
      );

  Widget buildMenuItem(MenuItem item) => ListTile(
        selected: currentItem == item,
        selectedTileColor: Colors.black12,
        minLeadingWidth: 20,
        leading: Icon(
          item.icon,
          color: Colors.white,
        ),
        title: Text(
          item.title,
          style: const TextStyle(color: Colors.white),
        ),
        onTap: () => onSelectedItem(item),
      );
}
