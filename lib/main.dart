import 'screens/menupage.dart';

import 'package:flutter/material.dart';
//import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'screens/bookpage.dart';
import 'screens/help.dart';
import 'screens/liked.dart';
import 'screens/rate_us.dart';
import 'screens/write.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SheetviewApp(),
      /*onGenerateRoute: router.generateRoute,
      initialRoute: WelcomeRoute,
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: ((context) => Info())),*/
    ),
  );
}

class SheetviewApp extends StatefulWidget {
  const SheetviewApp({Key? key}) : super(key: key);

  @override
  State<SheetviewApp> createState() => _SheetviewAppState();
}

class _SheetviewAppState extends State<SheetviewApp> {
  MenuItem currentItem = MenuItems.books;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      //style: DrawerStyle.Style1,
      angle: 0.0,
      borderRadius: 40,
      showShadow: true,
      //backgroundColor: Colors.white54,
      slideWidth: MediaQuery.of(context).size.width * 0.45,
      mainScreen: getScreen(),
      menuScreen: Builder(
        builder: (context) => MenuPage(
          currentItem: currentItem,
          onSelectedItem: (item) {
            setState(() {
              currentItem = item;
            });
            ZoomDrawer.of(context)!.close();
          },
        ),
      ),
    );
  }

  getScreen() {
    switch (currentItem) {
      case MenuItems.books:
        return const BookPage();
      case MenuItems.liked:
        return const Liked();
      case MenuItems.write:
        return const Write();
      case MenuItems.help:
        return const Help();
      case MenuItems.rate_us:
        return const RateUs();
    }
  }
}
